import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/Helper/widgets/app_text_field.dart';
import 'package:flutter_assignment/Helper/widgets/login_register_button.dart';
import 'package:flutter_assignment/Helper/widgets/login_register_title.dart';
import 'package:flutter_assignment/Helper/widgets/app_text_button.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'component/registerBackground.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RegisterBackground(
          loginSection: Padding(
            padding:  EdgeInsets.only(left: 16.sp,right: 16.sp),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height:16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      LoginRegisterTitle(title: "Create\nAccount"),
                    ],
                  ),
                  SizedBox(height:10.h),
                  AppTextField(
                    label: "Name",
                  ),
                  SizedBox(height:4.h),
                  AppTextField(
                    label: "Email",
                  ),
                  SizedBox(height:4.h),

                  AppTextField(
                    label: "Password",
                  ),
                  SizedBox(height:7.h),

                  LoginRegisterButton(
                    btnText: "Register",
                    onTap: (){print("hiii");},
                  ),
                  SizedBox(height:1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppTextButton(btnText: "Login", onPress: (){},),

                    ],
                  )


                ],
              ),
            ),

          ),
        )


    );
  }
}

