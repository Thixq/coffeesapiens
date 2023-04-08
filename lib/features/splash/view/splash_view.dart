import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/base/base_state/base_state.dart';
import '../../../core/base/base_view/base_view.dart';
import '../../../core/constant/app_constant.dart';
import '../../../core/extension/buildcontext_extension.dart';
import '../../../core/extension/string_extension.dart';
import '../viewmodel/splash_viewmodel.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends BaseState<SplashView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onPageBuilder: (context, value) => _buildScaffold(context),
      onModelReady: (model) async {
        //TODO: delete delay
        await Future.delayed(const Duration(milliseconds: 1000));
        model.pushToPage();
      },
    );
  }

  Scaffold _buildScaffold(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 90.sp,
          width: 90.sp,
          child: Image.asset(context.themeMode == Brightness.light
              ? AppConstant.SPLASH_IMAGE_DARK.pathToPng
              : AppConstant.SPLASH_IMAGE.pathToPng),
        ),
      ),
    );
  }
}
