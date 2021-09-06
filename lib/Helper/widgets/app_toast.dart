import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppToast {
  static show({required String msg}) {
    BotToast.showText(
      text: msg,
      contentColor:  Colors.black54,
    );
  }}