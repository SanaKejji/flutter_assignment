import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_assignment/Helper/constant/FCM_token.dart';
import 'package:http/http.dart' as http;
class NotificationService {

 static void setUpFirebase() async {
    await FirebaseMessaging.instance
        .getToken()
        .then((value) => fcmToken = value!);
    print("firebase token :  $fcmToken");
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);

    FirebaseMessaging.onMessage.listen((event) => onMessage(event));
  }

 static Future<dynamic> onMessage(RemoteMessage message) async {


      final body = message.notification!.body;
      final title = message.notification!.title;

      if (body != null && title != null)
        print("this is notification title:$title  this is notification body:$body");



  }

  static Future<bool> sendFcmMessage(String title, String message) async {
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

  }

