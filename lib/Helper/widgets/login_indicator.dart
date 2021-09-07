import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';

import '../colors.dart';

class LoadingIndicator extends StatelessWidget {
  final Color? color;

  const LoadingIndicator({Key? key, this.color}) : super(key: key);
  @override
  Widget build(_) => SpinKitChasingDots(
    color: color == null ? AppColors.Pink : color!,
    size: 30.0.sp,
  );
}
