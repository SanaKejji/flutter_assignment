import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/Helper/constant/FCM_token.dart';
import 'package:flutter_assignment/Models/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'api_routes.dart';

class LoginApi {
  Future<bool?> uploadToServer(
      String email,
      String password,
      ) async {

    http.Response response = await http.post(Uri.parse(ApiRoutes.POST_LOGIN),
        body: {'email': email,
          'password':password,
          "FCM_token":fcmToken
    });

if(response.statusCode==200)
  return true;

if(response.statusCode==404)
  {


    Fluttertoast.showToast(
        msg: "user not found",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
    return false;

  }



  }

    }


