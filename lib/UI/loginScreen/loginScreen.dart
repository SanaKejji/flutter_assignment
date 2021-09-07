import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/Controllers/login_controller.dart';
import 'package:flutter_assignment/UI/homeScreen/homeScreen.dart';
import 'package:get/get.dart' ;
import 'package:flutter_assignment/Helper/widgets/app_text_field.dart';
import 'package:flutter_assignment/Helper/widgets/login_register_button.dart';
import 'package:flutter_assignment/Helper/widgets/login_register_title.dart';
import 'package:flutter_assignment/Helper/widgets/app_text_button.dart';
import 'package:flutter_assignment/UI/loginScreen/component/loginBackground.dart';
import 'package:sizer/sizer.dart';

import 'component/text_field_section.dart';
 class LoginScreen extends GetView<LoginController> {

   @override
   Widget build(BuildContext context) {
     Get.put<LoginController>(LoginController());

     return Scaffold(
       body: LoginBackground(
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

                     LoginRegisterTitle(title: "Hello\nAgain!"),
                   ],
                 ),
                 SizedBox(height:16.h),
               Form(
                 key: controller.formKey ,
                   child: TextFieldPart(loginController: controller,),


               ),
                 SizedBox(height:7.h),

                 LoginRegisterButton(
                   btnText: "Login",
                   onTap: ()=>controller.onClickLogin(),
                 ),
                 SizedBox(height:6.h),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     AppTextButton(btnText: "Register", onPress: ()=>controller.onClickRegister(),),
                     AppTextButton(btnText: "Forget password", onPress: (){},)

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

