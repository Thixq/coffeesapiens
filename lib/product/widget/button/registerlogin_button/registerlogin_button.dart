import 'package:flutter/material.dart';

import '../../../../core/extension/buildcontext_extension.dart';
import '../../../../core/extension/language_extension.dart';

class RegisterLoginWidget extends StatelessWidget {
  const RegisterLoginWidget({
    super.key,
    required this.context,
    required this.onPressed,
    required this.text1,
    required this.text2,
  });

  final BuildContext context;
  final VoidCallback onPressed;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        overlayColor:
            MaterialStateColor.resolveWith((states) => Colors.transparent),
        onTap: () {
          onPressed();
        },
        child: Padding(
          padding: context.verticalPadding(value: 4),
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(text: text1.locale + " "),
                TextSpan(
                  text: text2.locale,
                  style: TextStyle(color: context.themeColorScheme.onPrimary),
                ),
              ],
              style: context.textTheme.bodyMedium,
            ),
          ),
        ),
      ),
    );
  }
}
