import 'package:flutter_assignment/Models/user_model.dart';
import 'package:flutter_assignment/UI/homeScreen/homeScreen.dart';
import 'package:flutter_assignment/UI/loginScreen/loginScreen.dart';
import 'package:flutter_assignment/service/local_storage.dart';
import 'package:flutter_assignment/service/push_notification_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AppController extends GetxController with StateMixin<Widget> {
  final BuildContext context;
  User? user;
  AppController(this.context);
  @override
  void onInit() {
    super.onInit();
   NotificationService.setUpFirebase(context);

    listenWidget().then((value) => change(value, status: RxStatus.success()));
  }

  Future<Widget> listenWidget() async {
    User? user;

    try {
      Map<String,dynamic> userMap = await SharedPref().read("user");
       user = User.fromJson(userMap);

    } catch (Excepetion) {
print("error");
    }

   if( user==null)
    return  LoginScreen() ;
    else return HomeScreen();
  }





}
