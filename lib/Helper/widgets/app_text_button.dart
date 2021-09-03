import 'package:flutter/material.dart';

import '../colors.dart';
import 'package:sizer/sizer.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({Key? key, required this.btnText, required this.onPress})
      : super(key: key);
  final String btnText;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        btnText,
        style: TextStyle(
            decoration: TextDecoration.underline,
            color: AppColors.Black,
            fontSize: 10.sp,
            fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        onPress();
      },
    );
  }
}
