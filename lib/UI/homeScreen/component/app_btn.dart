import 'package:flutter/material.dart';
import 'package:flutter_assignment/Helper/colors.dart';
import 'package:sizer/sizer.dart';
class AppButton extends StatelessWidget {
  const AppButton({Key? key,required this.btnTitle,required this.onPress,required this.btnColor}) : super(key: key);
final String btnTitle;
final Function onPress;
final Color btnColor;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(btnTitle,
      style: TextStyle(
        fontSize: 15.sp
      ),),
      style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: btnColor,
          elevation: 5,
          //minimumSize: Size(100, 50),
          padding: EdgeInsets.only(
              left: 50.sp,
              right: 50.sp,
              top: 13.sp,
              bottom: 13.sp
          )
      ),
      onPressed:() {
      onPress();
      },
    );
  }
}
