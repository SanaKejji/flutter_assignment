import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../colors.dart';

class LoginRegisterTitle extends StatelessWidget {
  const LoginRegisterTitle({Key? key,required this.title}) : super(key: key);
final String title ;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.left,
      textScaleFactor: 2.0,
      style: TextStyle(
          color: AppColors.White,
          fontSize: 18.sp,
        fontWeight: FontWeight.bold
      ),
    );
  }
}
