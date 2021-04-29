import 'dart:math' as math;

import 'package:flutter/material.dart';

extension SizeUtilExtension on BuildContext {
  Size get dimensions => MediaQuery.of(this).size;

  double get diagonal =>
      math.sqrt(math.pow(dimensions.width, 2) + math.pow(dimensions.height, 2));

  double wp(double percent) => ((dimensions.width * percent) / 100);
  double hp(double percent) => ((dimensions.height * percent) / 100);
  double dp(double percent) => ((diagonal * percent) / 100);
}
