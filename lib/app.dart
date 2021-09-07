import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controllers/app_controller.dart';

class Application extends GetView<AppController> {
  @override
  Widget build(BuildContext context) {
    Get.put<AppController>(AppController(context));
//    Get.put<AppController>(AppController(context));

    return GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
     // builder: BotToastInit(),


      defaultTransition: Transition.fade,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,

      home: Scaffold(body: controller.obx((state) => state!,
         // onLoading: LoadingIndicator()
      )),
    );
  }
}