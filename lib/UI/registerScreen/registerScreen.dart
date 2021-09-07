import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/Controllers/register_controller.dart';
import 'package:flutter_assignment/Helper/widgets/app_text_field.dart';
import 'package:flutter_assignment/Helper/widgets/login_indicator.dart';
import 'package:flutter_assignment/Helper/widgets/login_register_button.dart';
import 'package:flutter_assignment/Helper/widgets/login_register_title.dart';
import 'package:flutter_assignment/Helper/widgets/app_text_button.dart';
import 'package:flutter_assignment/UI/registerScreen/component/text_fields_section.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'component/registerBackground.dart';

class RegisterScreen extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    Get.put<RegisterController>(RegisterController());

    return Scaffold(
        body: RegisterBackground(
      loginSection: Padding(
        padding: EdgeInsets.only(left: 16.sp, right: 16.sp),
        child: SingleChildScrollView(
          child: controller.obx((state)=>(
              Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LoginRegisterTitle(title: "Create\nAccount"),
              ],
            ),
            Form(
                key: controller.formKey,
                child: TextFieldSection(

                    registerController: controller)),
            LoginRegisterButton(
              btnText: "Register",
              onTap: ()=> controller.onClickRegister(context),
            ),
            SizedBox(height: 1.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppTextButton(
                  btnText: "Login",
                  onPress: () => controller.onClickLogin(),
                ),
              ],
            )
            ],
          )),
          ))

          ),
        ),
      );
  }
}
