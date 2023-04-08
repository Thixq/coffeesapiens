import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

import '../../../core/extension/buildcontext_extension.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.textTextFormFiled,
    this.maskedTextController,
    this.decoration,
    this.validator,
    this.focusNode,
    this.obscureText = false,
    this.textInputType,
    this.onEditingComplete,
  });

  final TextEditingController? maskedTextController;
  final String textTextFormFiled;
  final InputDecoration? decoration;
  final String? Function(String? p1)? validator;
  final FocusNode? focusNode;
  final bool obscureText;
  final TextInputType? textInputType;
  final void Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textTextFormFiled,
          style: context.textTheme.bodyMedium!
              .copyWith(color: context.themeColorScheme.primary),
        ),
        context.sizedBox(value: 4),
        TextFormField(
          controller: maskedTextController,
          style: context.textTheme.bodyMedium,
          decoration: decoration,
          validator: validator,
          focusNode: focusNode,
          obscureText: obscureText,
          keyboardType: textInputType,
          onEditingComplete: onEditingComplete,
        ),
      ],
    );
  }
}
