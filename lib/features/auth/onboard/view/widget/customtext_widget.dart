import 'package:flutter/material.dart';

import '../../../../../core/extension/buildcontext_extension.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          overlayColor:
              MaterialStateColor.resolveWith((states) => Colors.transparent),
        ),
        onPressed: () {
          onPress();
        },
        child: Text(
          text,
          style: context.textTheme.bodyMedium,
        ));
  }
}
