import 'dart:math';

import 'package:coffeesapiens_v2/core/model/user/user_model.dart';

import 'user_enum.dart';

extension ShiftExtension on Eshift {
  int get rawValue {
    switch (this) {
      case Eshift.MIDDLEMAN:
        return 0;
      case Eshift.MORNING:
        return 1;
      case Eshift.NIGHT:
        return 2;
      default:
        return -1;
    }
  }
}

extension BranchExtension on Ebranch {
  String get rawValue {
    switch (this) {
      case Ebranch.KANYON:
        return "Kanyon";
      case Ebranch.KARAKOY:
        return "Karaköy";
      case Ebranch.CADDEBOSTAN:
        return "Cadde Bostan";
      default:
        return "null";
    }
  }
}
