import 'package:coffeesapiens_v2/product/widget/custom_textformfield/custom_textformfiled.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
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
import '../../../../product/widget/login_button/login_button.dart';
import '../../../../product/widget/social_button/social_button_class.dart';
import '../../../../product/widget/social_button/social_button_widget.dart';
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
        print("object");
        viewModel.pageController = PageController();
        viewModel.textEditingController = TextEditingController();
        viewModel.textEditingController2 =
            MaskedTextController(mask: "(000)-000-00-00");
      },
      onDispose: (viewModel) {
        viewModel.pageController?.dispose();
        viewModel.textEditingController?.dispose();
        viewModel.textEditingController2?.dispose();
      },
    );
  }

  Scaffold buildScaffold(BuildContext context, AuthViewModel viewModel) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: PageView(
          controller: viewModel.pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            buildLoginView(context, viewModel),
            Padding(
              padding: context.horizontalPadding(value: 4),
              child: Center(
                child: Column(
                  children: [
                    buildChangeLogo(context),
                    CustomTextFormField(
                      textTextFormFiled: LocaleKeys.e_mail.locale,
                      textInputType: TextInputType.emailAddress,
                      onEditingComplete: () {},
                    ),
                    CustomTextFormField(
                      maskedTextController: viewModel.textEditingController2,
                      textTextFormFiled: "Telefon",
                      textInputType: TextInputType.phone,
                      onEditingComplete: () {},
                    ),
                    Observer(builder: (_) {
                      return CustomTextFormField(
                        maskedTextController: viewModel.textEditingController,
                        textTextFormFiled: LocaleKeys.password.locale,
                        textInputType: TextInputType.visiblePassword,
                        obscureText: viewModel.isVisible,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            splashColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: () {
                              viewModel.changeVisible();
                            },
                            icon: viewModel.isVisible
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                          ),
                        ),
                      );
                    }),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildLoginView(BuildContext context, AuthViewModel viewModel) {
    return Padding(
      padding: context.horizontalPadding(value: 4),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            buildChangeLogo(context),
            const Spacer(),
            buildEmail(context),
            const Spacer(),
            buildPassword(context, viewModel),
            const Spacer(),
            buildForgotPassword(context),
            const Spacer(),
            buildLoginButton(),
            const Spacer(),
            buildDivider(context),
            const Spacer(),
            buildSocialLoginButton(),
            const Spacer(
              flex: 5,
            ),
            buildRegisterButton(context, viewModel)
          ],
        ),
      ),
    );
  }

  Align buildRegisterButton(BuildContext context, AuthViewModel viewModel) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          viewModel.changePage(1);
        },
        child: Padding(
          padding: context.verticalPadding(value: 4),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(text: LocaleKeys.not_a_member.locale + " "),
                TextSpan(
                  text: LocaleKeys.register_now.locale,
                  style: TextStyle(color: context.themeColorScheme.onPrimary),
                ),
              ],
              style: context.textTheme.bodySmall!
                  .copyWith(color: context.themeColorScheme.primary),
            ),
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

  LoginButton buildLoginButton() {
    return LoginButton(
      text: LocaleKeys.sign_in.locale,
      onPressed: () {},
    );
  }

  Text buildForgotPassword(BuildContext context) {
    return Text(
      LocaleKeys.forgot_password.locale,
      style:
          context.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
    );
  }

  Column buildPassword(BuildContext context, AuthViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.password.locale,
          style: context.textTheme.bodyMedium!
              .copyWith(color: context.themeColorScheme.primary),
        ),
        context.sizedBox(value: 4),
        Observer(builder: (_) {
          return TextFormField(
            style: context.textTheme.bodyMedium,
            obscureText: viewModel.isVisible,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  viewModel.changeVisible();
                },
                icon: viewModel.isVisible
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
            ),
          );
        }),
      ],
    );
  }

  Column buildEmail(BuildContext context, {AuthViewModel? viewModel}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.e_mail.locale,
          style: context.textTheme.bodyMedium!
              .copyWith(color: context.themeColorScheme.primary),
        ),
        context.sizedBox(value: 4),
        TextFormField(
          style: context.textTheme.bodyMedium,
        ),
      ],
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
