import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
class NotificationHandler{
  static FlutterLocalNotificationsPlugin   flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();

  static  BuildContext? ctx ;
  //NotificationHandler({this.myContext});
 static void initNotification(BuildContext context){
   ctx=context;
  // var initAndroid =
  // new AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettingsAndroid =
  new AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettingsIOS = new IOSInitializationSettings();
  var initializationSettings = new InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
  flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: onSelectNotification);
}

  static Future showNotification(String? title,String? body) async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.max, priority: Priority.high);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: title,
    );
  }

 static Future onSelectNotification(String? payload ) async {
   if(payload == 'Hello') return;
    showDialog(
      context: ctx!,
      builder: (_) {
        return new AlertDialog(
          title: Text("Your Notification Detail"),
          content: Text("Sure you want to exit the app?"),
          actions: [
            new TextButton(
              child: new Text("Yes"),
              onPressed: () {
                //TODO Signout
                SystemNavigator.pop();              },
            ),
            new TextButton(
              child: new Text("No"),
              onPressed: () {
                Navigator.of(ctx!).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
