import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../colors.dart';

class LoginRegisterButton extends StatelessWidget {
  const LoginRegisterButton({Key? key,required this.btnText,required this.onTap}) : super(key: key);
final String btnText;
final Function onTap;
  @override
  Widget build(BuildContext context) {
    return      Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap:(){ onTap();},
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 20.0.w,
                height: 20.0.w,
                decoration: new BoxDecoration(
                  color: AppColors.Yellow,
                  shape: BoxShape.circle,
                ),),
              Positioned(
                top: 15,
                right: 20,
                child: Text(
                  btnText,
                  textAlign: TextAlign.left,
                  textScaleFactor: 2.0,
                  style: TextStyle(
                      color: AppColors.Black,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
