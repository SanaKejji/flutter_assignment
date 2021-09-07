import 'package:flutter_assignment/Api/api_routes.dart';
import 'package:flutter_assignment/Api/login_api.dart';
import 'package:flutter_assignment/Helper/constant/FCM_token.dart';
import 'package:flutter_assignment/Models/user_model.dart';
import 'package:flutter_assignment/UI/homeScreen/homeScreen.dart';
import 'package:flutter_assignment/UI/registerScreen/registerScreen.dart';
import 'package:flutter_assignment/service/local_storage.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController with StateMixin<Widget> {
  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  onClickLogin() async{

    var user = User(
      email: email.text,
      fcmToken: fcmToken!,
      password: password.text,
    );


    final bool? r =await  LoginApi().uploadToServer(
     email.text,
      password.text
    );
    if (r! == true)
    {
      SharedPref().save("user", user);
      Get.offAll(HomeScreen());}

    else {

    }

  }

 void onClickRegister(){
    Get.to(
      RegisterScreen()
    );

  }




}
