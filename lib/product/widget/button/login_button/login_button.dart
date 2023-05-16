import 'package:coffeesapiens_v2/core/extension/language_extension.dart';

import '../../../../core/extension/buildcontext_extension.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const LoginButton({required this.text, super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith(
            (states) => context.themeColorScheme.onError),
        minimumSize:
            MaterialStateProperty.all<Size>(Size(double.infinity, 27.sp)),
        overlayColor:
            MaterialStateColor.resolveWith((states) => Colors.transparent),
        elevation: MaterialStateProperty.resolveWith((states) => 0),
        shape: MaterialStateProperty.resolveWith((states) =>
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.sp))),
      ),
      child: Text(
        text.locale,
        style:
            context.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}
