import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'UI/loginScreen/loginScreen.dart';

void main() {
  runApp(
      Sizer(builder:(context,orientation,deviceType) =>MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),

      ))
    
  );
}

