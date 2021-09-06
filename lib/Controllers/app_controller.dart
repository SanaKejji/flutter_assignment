import 'package:flutter_assignment/Models/user_model.dart';
import 'package:flutter_assignment/UI/homeScreen/homeScreen.dart';
import 'package:flutter_assignment/UI/loginScreen/loginScreen.dart';
import 'package:flutter_assignment/service/push_notification_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class AppController extends GetxController with StateMixin<Widget> {
  final box = GetStorage();
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
  await  loadObject();
    if(user == null)
    return  LoginScreen() ;
    else return HomeScreen();
  }

  loadObject() async {
    try {
      user = User.fromJson(await GetStorage().read("user"));
    } catch (e) {
      user = null;
    }
  }
}
