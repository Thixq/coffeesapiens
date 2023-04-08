import 'package:coffeesapiens_v2/core/model/user/user_enum.dart';
import 'package:json_annotation/json_annotation.dart';

import '../base_model/base_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User extends BaseModel<User> {
  final int id;
  final String name;
  final int phone;
  final String photoUrl;
  final List<Week>? month;

  User(
      {required this.id,
      required this.name,
      required this.phone,
      required this.photoUrl,
      required this.month});

  @override
  User fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }
}

@JsonSerializable()
class Week {
  final Day pazartesi, sali, carsamba, persembe, cuma, cumartesi, pazar;

  Week(
      {required this.pazartesi,
      required this.sali,
      required this.carsamba,
      required this.persembe,
      required this.cuma,
      required this.cumartesi,
      required this.pazar});

  factory Week.fromJson(Map<String, dynamic> json) {
    return _$WeekFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WeekToJson(this);
  }
}

@JsonSerializable()
class Day {
  final Eshift dayShift;
  final Ebranch branch;
  final DateTime dateTime;

  Day({required this.dayShift, required this.branch, required this.dateTime});

  factory Day.fromJson(Map<String, dynamic> json) {
    return _$DayFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$DayToJson(this);
  }
}
