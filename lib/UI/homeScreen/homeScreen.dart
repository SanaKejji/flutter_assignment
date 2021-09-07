import 'package:flutter/material.dart';
import 'package:flutter_assignment/Controllers/home_controller.dart';
import 'package:flutter_assignment/Helper/colors.dart';
import 'package:flutter_assignment/service/local_storage.dart';
import 'package:flutter_assignment/service/push_notification_service.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'component/app_btn.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   //  NotificationService.setUpFirebase();
//
// }
class HomeScreen extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    Get.put<HomeController>(HomeController());


    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
appBar: AppBar(
  title: Text("Home Screen"),
  centerTitle: true,
  backgroundColor: AppColors.DarkBlue,

),
   body:Center(
       child: Column(
         children: [
           SizedBox(height:20.h ,),
        AppButton(
             btnColor: AppColors.Blue,
             btnTitle: "Hello",
             onPress: (){
               NotificationService.sendFcmMessage("Hello", "Hello my friend");},
           ),
           SizedBox(height:6.h ,),

           AppButton(
             btnColor: AppColors.Pink,
             btnTitle: "Bye",
             onPress: (){

SharedPref().remove('user');
               NotificationService.sendFcmMessage("Good Bye me friend", "Sure you want to exit the app?");},
           ),
         ],
       ),
   )
      ),
    );
  }
}
