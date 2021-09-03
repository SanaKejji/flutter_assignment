import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/Helper/colors.dart';
import 'package:flutter_assignment/Helper/widgets/app_text_field.dart';
import 'package:flutter_assignment/Helper/widgets/login_register_button.dart';
import 'package:flutter_assignment/Helper/widgets/login_register_title.dart';
import 'package:flutter_assignment/UI/loginScreen/component/loginBackground.dart';
import 'package:sizer/sizer.dart';
 class LoginScreen extends StatefulWidget {
   const LoginScreen({Key? key}) : super(key: key);
 
   @override
   _LoginScreenState createState() => _LoginScreenState();
 }
 
 class _LoginScreenState extends State<LoginScreen> {
   @override
   Widget build(BuildContext context) {
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
                 AppTextField(
                   label: "Email",
                 ),
                 SizedBox(height:4.h),

                 AppTextField(
                   label: "Password",
                 ),
                 SizedBox(height:7.h),

                 LoginRegisterButton(
                   btnText: "Login",
                   onTap: (){print("hiii");},
                 ),
                 SizedBox(height:6.h),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     TextButton(
                       child: Text("Register",
                         style: TextStyle(
                             color: AppColors.Black,
                             fontSize: 10.sp,
                             fontWeight: FontWeight.bold
                         ),),
                       onPressed:() {

                       },

                     ),

                     TextButton(
                       child: Text("ForgetPassword"),
                       onPressed:() {

                       },
                     ),
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

