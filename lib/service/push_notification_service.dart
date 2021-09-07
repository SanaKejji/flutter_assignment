import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_assignment/Helper/constant/FCM_token.dart';
import 'package:flutter_assignment/Helper/network_status.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'notification_handler.dart';
class NotificationService {

 static void setUpFirebase(BuildContext context) async {

    await FirebaseMessaging.instance
        .getToken()
        .then((value) => fcmToken = value!);
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);

    FirebaseMessaging.onMessage.listen((event) => onMessage(event));

    NotificationHandler.initNotification(context);
  }

 static Future<dynamic> onMessage(RemoteMessage message) async {


      final body = message.notification!.body;
      final title = message.notification!.title;

      if (body != null && title != null)
      NotificationHandler.showNotification(title, body);


  }

  static Future<bool> sendFcmMessage(String title, String message) async {
   print("sendFcmMessage");
    if (await NetworkStatus.internetStatus()){
    print(message);
    try {

      var url = 'https://fcm.googleapis.com/fcm/send';
      var header = {
        "Content-Type": "application/json",
        "Authorization": "key=$serverKey",
      };
      var request = {
        "notification": {
          "title": title,
          "body": message,
          "sound": "default",
          "color": "#990000",
        },
        "priority": "high",
        "to": "$fcmToken",
      };

      var client = new http.Client();
     // var response =
      await client.post(Uri.parse(url), headers: header, body: json.encode(request));
      //print(response.headers);
      return true;
    } catch (e, s) {
      print(e);
      return false;
    }
  }
   else{

      Fluttertoast.showToast(
          msg: "Add Your Profile Image",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0
      );
     print("Check your internet connection"); return false;}}
}






