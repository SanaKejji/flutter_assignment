import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/Helper/constant/FCM_token.dart';
import 'package:flutter_assignment/Models/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'api_routes.dart';

class RegisterApi {
  Future<bool?> uploadToServer(
    File image,
    User user,
  ) async {
    var request =
        new http.MultipartRequest("POST", Uri.parse(ApiRoutes.POST_REGISTER));

    request.files.add(await http.MultipartFile.fromPath('userImg', image.path));
    request.fields['name'] = user.name!;
    request.fields['password'] = user.password;
    request.fields['FCM_token'] = '$fcmToken';
    request.fields['email'] = user.email;
    request.fields['phone'] = user.phone!;

    request.send().then((response) {
      http.Response.fromStream(response).then((onValue) {
        try {
          print(response.statusCode);
          if (response.statusCode == 201) {
            return true;
          }
          if (response.statusCode == 400 || response.statusCode == 500) {
            Fluttertoast.showToast(
                msg: "Try Again",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.grey,
                textColor: Colors.white,
                fontSize: 16.0);
            return false;
          }
          if (response.statusCode == 404) {
            Fluttertoast.showToast(
                msg: "email is already used",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.grey,
                textColor: Colors.white,
                fontSize: 16.0);
            return false;
          }
          // get your response here...
        } catch (e) {}
      });
    });
  }
}
