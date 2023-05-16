import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/extension/buildcontext_extension.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.textTextFormFiled,
    this.maxLength,
    this.maskedTextController,
    this.decoration,
    this.validator,
    this.focusNode,
    this.obscureText = false,
    this.textInputType,
    this.textInputAction,
    this.inputFormatters,
    this.onEditingComplete,
    this.onSaved,
  });

  final int? maxLength;
  final TextEditingController? maskedTextController;
  final String textTextFormFiled;
  final InputDecoration? decoration;
  final String? Function(String? p1)? validator;
  final FocusNode? focusNode;
  final bool obscureText;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onEditingComplete;
  final void Function(String?)? onSaved;

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
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          textInputAction: textInputAction,
          controller: maskedTextController,
          style: context.textTheme.bodyMedium,
          decoration: decoration,
          validator: validator,
          focusNode: focusNode,
          obscureText: obscureText,
          keyboardType: textInputType,
          onEditingComplete: onEditingComplete,
          onSaved: onSaved,
        ),
      ],
    );
  }
}
