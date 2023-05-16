import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/extension/buildcontext_extension.dart';
import 'ISocial_button_class.dart';

class SocialButton extends StatelessWidget {
  const SocialButton(
      {super.key, required this.social, required this.onPressed});
  final ISocial social;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor:
          MaterialStateColor.resolveWith((states) => Colors.transparent),
      onTap: () {
        onPressed();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              width: 2,
              color: context.themeColorScheme.primary.withOpacity(.5)),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.sp),
          child: SvgPicture.asset(
            social.svgPath,
            height: social.size.height,
            width: social.size.width,
          ),
        ),
      ),
    );
  }
}
