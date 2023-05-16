import 'package:flutter/material.dart';

abstract class ISocial {
  late final String svgPath;
  late final Size size;
  ISocial({required this.svgPath, required this.size});
}
