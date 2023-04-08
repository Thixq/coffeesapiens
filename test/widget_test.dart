// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:coffeesapiens_v2/core/model/user/user_enum.dart';
import 'package:coffeesapiens_v2/core/model/user/user_extension.dart';
import 'package:coffeesapiens_v2/core/model/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:coffeesapiens_v2/main.dart';

void main() {
  setUp(() {});
  test(
    "list",
    () {
      List<User> testUser = List.generate(
        3,
        (index) => User(
          id: 1,
          name: "HORHASAN",
          phone: 5515993731,
          photoUrl: "horhasan.jpg",
          month: [
            Week(
              pazartesi: Day(
                  dayShift: Eshift.NIGHT,
                  branch: Ebranch.KANYON,
                  dateTime: DateTime.now()),
              sali: Day(
                dayShift: Eshift.MORNING,
                branch: Ebranch.KANYON,
                dateTime: DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day + 1),
              ),
              carsamba: Day(
                dayShift: Eshift.MORNING,
                branch: Ebranch.KANYON,
                dateTime: DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day + 2),
              ),
              persembe: Day(
                dayShift: Eshift.MORNING,
                branch: Ebranch.KANYON,
                dateTime: DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day + 3),
              ),
              cuma: Day(
                dayShift: Eshift.MORNING,
                branch: Ebranch.KANYON,
                dateTime: DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day + 4),
              ),
              cumartesi: Day(
                dayShift: Eshift.MORNING,
                branch: Ebranch.KANYON,
                dateTime: DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day + 5),
              ),
              pazar: Day(
                dayShift: Eshift.MORNING,
                branch: Ebranch.KANYON,
                dateTime: DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day + 6),
              ),
            ),
          ],
        ),
      );
      print(testUser[0].month![0].sali.dayShift.rawValue);
      expect(testUser[0].id, 1);
    },
  );
}
