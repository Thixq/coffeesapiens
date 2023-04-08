import 'package:coffeesapiens_v2/core/constant/app_constant.dart';

extension AssetsExtension on String {
  String get pathToPng => "${AppConstant.SPLASH_IMAGE_PATH}$this.png";
  String get pathToSvg => "${AppConstant.SPLASH_SVG_PATH}$this.svg";
}
