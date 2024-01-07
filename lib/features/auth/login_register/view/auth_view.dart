import 'package:coffeesapiens_v2/product/utils/regex/form_validate/form_validate.dart';

import '../../../../product/utils/regex/phone_unmask/phone_unmask.dart';
import 'package:flutter/services.dart';
import 'package:text_mask/text_mask.dart';

import '../../../../product/widget/button/registerlogin_button/registerlogin_button.dart';
import '../../../../product/widget/custom_textformfield/custom_textformfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/base/base_state/base_state.dart';
import '../../../../core/base/base_view/base_view.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../../core/extension/buildcontext_extension.dart';
import '../../../../core/extension/language_extension.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/language/locale_keys.g.dart';
import '../../../../product/widget/button/login_button/login_button.dart';
import '../../../../product/widget/button/social_button/social_button_class.dart';
import '../../../../product/widget/button/social_button/social_button_widget.dart';
import '../viewmodel/auth_viewmodel.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends BaseState<AuthView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
      viewModel: AuthViewModel(),
      onPageBuilder: (context, viewModel) => buildScaffold(context, viewModel),
      onModelReady: (viewModel) {
        viewModel.pageController = PageController();

        viewModel.loginKey = GlobalKey<FormState>();
        viewModel.registerKey = GlobalKey<FormState>();
      },
      onDispose: (viewModel) {
        viewModel.pageController?.dispose();
      },
    );
  }

  Scaffold buildScaffold(BuildContext context, AuthViewModel viewModel) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: PageView(
            controller: viewModel.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              buildLoginView(context, viewModel),
              buildRegisterScroll(context, viewModel),
            ],
          ),
        ),
      ),
    );
  }

  SingleChildScrollView buildRegisterScroll(
      BuildContext context, AuthViewModel viewModel) {
    return SingleChildScrollView(
      physics: MediaQuery.of(context).viewInsets.bottom > 0
          ? const ClampingScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: 100.h -
                (context.mediaQuery.padding.bottom +
                    context.mediaQuery.padding.top),
            child: buildRegisterView(context, viewModel),
          ),
          SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom / 2.5,
          ),
        ],
      ),
    );
  }

  Widget buildRegisterView(BuildContext context, AuthViewModel viewModel) {
    return Padding(
      padding: context.horizontalPadding(value: 4),
      child: Center(
        child: Form(
          key: viewModel.registerKey,
          child: Column(
            children: [
              buildChangeLogo(context),
              buildEmail(viewModel),
              const Spacer(),
              buildPhone(context),
              const Spacer(),
              buildPassword(viewModel),
              const Spacer(),
              LoginButton(
                text: LocaleKeys.register,
                onPressed: () {
                  viewModel.registerKey.currentState!.validate();
                },
              ),
              const Spacer(),
              buildDivider(context),
              const Spacer(),
              buildSocialLoginButton(),
              const Spacer(
                flex: 5,
              ),
              RegisterLoginWidget(
                  context: context,
                  onPressed: () {
                    viewModel.changePage(0);
                  },
                  text1: LocaleKeys.are_you_a_member,
                  text2: LocaleKeys.sign_in_now),
            ],
          ),
        ),
      ),
    );
  }

  CustomTextFormField buildPhone(BuildContext context) {
    return CustomTextFormField(
      textTextFormFiled: LocaleKeys.phone.locale,
      textInputType: TextInputType.number,
      textInputAction: TextInputAction.next,
      validator: (p1) {
        if (p1!.isEmpty) return LocaleKeys.auth_isfilled.locale;
        if (p1.length < 15) return LocaleKeys.auth_phone_validate.locale;
        return null;
      },
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        TextMask(pallet: "(###) ### ## ##"),
      ],
      maxLength: 15,
      onEditingComplete: () {
        FocusScope.of(context).nextFocus();
      },
      decoration: const InputDecoration(counterText: ''),
    );
  }

  Observer buildPassword(AuthViewModel viewModel) {
    return Observer(builder: (_) {
      return CustomTextFormField(
        validator: (p1) {
          if (p1!.isEmpty) return LocaleKeys.auth_isfilled.locale;
          if (p1.length < 8)
            return LocaleKeys.auth_password_powerful_validate.locale;
          return null;
        },
        textTextFormFiled: LocaleKeys.password.locale,
        textInputType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
        obscureText: viewModel.isVisible,
        decoration: InputDecoration(
          suffixIcon: buildVisible(viewModel),
        ),
      );
    });
  }

  CustomTextFormField buildEmail(AuthViewModel viewModel) {
    return CustomTextFormField(
      validator: (p1) {
        if (p1!.isEmpty) return LocaleKeys.auth_isfilled.locale;
        if (!FormValidate.instance.EmailValidate(p1)) {
          return LocaleKeys.auth_email_validate.locale;
        }
        return null;
      },
      textTextFormFiled: LocaleKeys.e_mail.locale,
      textInputType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onEditingComplete: () {
        FocusScope.of(context).nextFocus();
      },
    );
  }

  IconButton buildVisible(AuthViewModel viewModel) {
    return IconButton(
      style: ButtonStyle(
        overlayColor:
            MaterialStateColor.resolveWith((states) => Colors.transparent),
      ),
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {
        viewModel.changeVisible();
      },
      icon: viewModel.isVisible
          ? const Icon(Icons.visibility_off)
          : const Icon(Icons.visibility),
    );
  }

  Padding buildLoginView(BuildContext context, AuthViewModel viewModel) {
    return Padding(
      padding: context.horizontalPadding(value: 4),
      child: Center(
        child: Form(
          key: viewModel.loginKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              buildChangeLogo(context),
              const Spacer(),
              buildEmail(viewModel),
              const Spacer(),
              buildPassword(viewModel),
              const Spacer(),
              buildForgotPassword(context),
              const Spacer(),
              LoginButton(
                text: LocaleKeys.sign_in,
                onPressed: () {
                  viewModel.loginKey.currentState!.validate();
                },
              ),
              const Spacer(),
              buildDivider(context),
              const Spacer(),
              buildSocialLoginButton(),
              const Spacer(
                flex: 5,
              ),
              RegisterLoginWidget(
                context: context,
                onPressed: () {
                  viewModel.changePage(1);
                },
                text1: LocaleKeys.not_a_member,
                text2: LocaleKeys.register_now,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildSocialLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SocialButton(
          social: Social.apple(),
          onPressed: () {},
        ),
        SocialButton(
          social: Social.facebook(),
          onPressed: () {},
        ),
        SocialButton(
          social: Social.google(),
          onPressed: () {},
        ),
      ],
    );
  }

  Row buildDivider(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            indent: 25.sp,
            endIndent: 20.sp,
            color: context.themeColorScheme.primary,
            thickness: 1,
            height: 2,
          ),
        ),
        Text(
          LocaleKeys.or.locale,
          style: context.textTheme.bodyMedium!
              .copyWith(color: context.themeColorScheme.primary),
        ),
        Expanded(
          child: Divider(
            endIndent: 25.sp,
            indent: 20.sp,
            color: context.themeColorScheme.primary,
            thickness: 1,
            height: 2,
          ),
        ),
      ],
    );
  }

  Text buildForgotPassword(BuildContext context) {
    return Text(
      LocaleKeys.forgot_password.locale,
      style: context.textTheme.bodyMedium,
    );
  }

  Align buildChangeLogo(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Image.asset(
        context.themeMode == Brightness.light
            ? AppConstant.SPLASH_IMAGE_DARK.pathToPng
            : AppConstant.SPLASH_IMAGE.pathToPng,
        height: 60.sp,
      ),
    );
  }
}
