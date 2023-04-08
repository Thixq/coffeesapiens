import 'package:coffeesapiens_v2/core/constant/navigation_constant.dart';
import 'package:coffeesapiens_v2/core/extension/language_extension.dart';
import 'package:coffeesapiens_v2/core/init/navigation/navigation_service.dart';
import 'package:coffeesapiens_v2/product/constant/product_constant.dart';

import '../../../../core/constant/app_constant.dart';
import '../../../../core/init/language/locale_keys.g.dart';
import '../model/onboard_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'onborad_viewmodel.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store {
  PageController pageController = PageController();

  @observable
  bool isDone = false;

  String next = LocaleKeys.ob_next.locale;
  String done = LocaleKeys.ob_done.locale;

  @action
  void nextPage() {
    pageController.page == 2
        ? null
        : pageController.nextPage(
            duration: AppConstant.smallDuration, curve: Curves.easeInCirc);

    if (isDone)
      NavigationService.instance
          .navigateToPageClear(path: NavigationConstant.AUTH_VIEW);
  }

  void previousPage() {
    pageController.page == 0
        ? null
        : pageController.previousPage(
            duration: AppConstant.smallDuration, curve: Curves.easeInCirc);
  }

  void onboardDispose() {
    pageController.dispose();
  }

  List<OnboardModel> onBoardList = [
    OnboardModel(
        imagePath: ProductConstants.SPLASH_ONBOARD_ONE_PATH,
        title: LocaleKeys.welcome_app,
        description: LocaleKeys.test),
    OnboardModel(
        imagePath: ProductConstants.SPLASH_ONBOARD_TWO_PATH,
        title: LocaleKeys.welcome_app,
        description: LocaleKeys.test),
    OnboardModel(
        imagePath: ProductConstants.SPLASH_ONBOARD_THREE_PATH,
        title: LocaleKeys.welcome_app,
        description: LocaleKeys.test),
  ];
}
