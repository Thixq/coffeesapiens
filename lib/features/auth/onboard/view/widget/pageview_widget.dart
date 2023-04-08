import '../../../../../core/extension/buildcontext_extension.dart';
import '../../../../../core/extension/language_extension.dart';
import '../../../../../core/extension/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PageViewWidget extends StatelessWidget {
  final String pageImage, title, description;
  const PageViewWidget(
      {super.key,
      required this.pageImage,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(height: 80.sp, pageImage.pathToSvg),
        context.sizedBox(value: 8),
        Text(title.locale, style: context.textTheme.titleMedium),
        context.sizedBox(value: 24),
        Padding(
          padding: context.horizontalPadding(value: 4),
          child: Text(
            description.locale * 10,
            style: context.textTheme.bodyMedium,
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
