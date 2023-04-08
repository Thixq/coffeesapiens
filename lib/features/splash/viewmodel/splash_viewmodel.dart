import 'package:coffeesapiens_v2/core/constant/navigation_constant.dart';
import 'package:coffeesapiens_v2/core/init/navigation/navigation_service.dart';
import 'package:mobx/mobx.dart';
part 'splash_viewmodel.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store {
  void pushToPage() {
    NavigationService routeService = NavigationService.instance;
    routeService.navigateToPageClear(path: NavigationConstant.ONBORAD_VIEW);
  }
}
