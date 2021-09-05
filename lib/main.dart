import 'package:flutter/material.dart';
import 'package:flutter_assignment/Helper/constant/FCM_token.dart';
import 'package:flutter_assignment/UI/registerScreen/registerScreen.dart';
import 'package:flutter_assignment/service/push_notification_service.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'UI/homeScreen/homeScreen.dart';
import 'UI/loginScreen/loginScreen.dart';


// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async{
//   await Firebase.initializeApp();
//
//   print("A bg message : ${message.messageId}");
// }

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
await Firebase.initializeApp();

  runApp(
      Sizer(builder:(context,orientation,deviceType) =>MaterialApp(


        debugShowCheckedModeBanner: false,
        home: HomeScreen(),

      ))

  );
}

