import 'package:flutter/material.dart';
import 'package:flutter_assignment/app.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'UI/homeScreen/homeScreen.dart';
import 'package:get_storage/get_storage.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  await GetStorage.init();

  runApp(
      Sizer(builder:(context,orientation,deviceType) =>LayoutBuilder(
        builder: (_, constraints) {
          return OrientationBuilder(builder: (context, orientation) {
            SizerUtil.setScreenSize(constraints, orientation);


                  return Application();


          });
        },
      ))

  );
}

