// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      name: json['name'] as String,
      phone: json['phone'] as int,
      photoUrl: json['photoUrl'] as String,
      month: (json['month'] as List<dynamic>?)
          ?.map((e) => Week.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'photoUrl': instance.photoUrl,
      'month': instance.month,
    };

Week _$WeekFromJson(Map<String, dynamic> json) => Week(
      pazartesi: Day.fromJson(json['pazartesi'] as Map<String, dynamic>),
      sali: Day.fromJson(json['sali'] as Map<String, dynamic>),
      carsamba: Day.fromJson(json['carsamba'] as Map<String, dynamic>),
      persembe: Day.fromJson(json['persembe'] as Map<String, dynamic>),
      cuma: Day.fromJson(json['cuma'] as Map<String, dynamic>),
      cumartesi: Day.fromJson(json['cumartesi'] as Map<String, dynamic>),
      pazar: Day.fromJson(json['pazar'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeekToJson(Week instance) => <String, dynamic>{
      'pazartesi': instance.pazartesi,
      'sali': instance.sali,
      'carsamba': instance.carsamba,
      'persembe': instance.persembe,
      'cuma': instance.cuma,
      'cumartesi': instance.cumartesi,
      'pazar': instance.pazar,
    };

Day _$DayFromJson(Map<String, dynamic> json) => Day(
      dayShift: $enumDecode(_$EshiftEnumMap, json['dayShift']),
      branch: $enumDecode(_$EbranchEnumMap, json['branch']),
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
      'dayShift': _$EshiftEnumMap[instance.dayShift]!,
      'branch': _$EbranchEnumMap[instance.branch]!,
      'dateTime': instance.dateTime.toIso8601String(),
    };

const _$EshiftEnumMap = {
  Eshift.MIDDLEMAN: 'MIDDLEMAN',
  Eshift.MORNING: 'MORNING',
  Eshift.NIGHT: 'NIGHT',
};

const _$EbranchEnumMap = {
  Ebranch.KANYON: 'KANYON',
  Ebranch.KARAKOY: 'KARAKOY',
  Ebranch.CADDEBOSTAN: 'CADDEBOSTAN',
};
