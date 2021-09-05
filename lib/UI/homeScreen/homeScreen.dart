import 'package:flutter/material.dart';
import 'package:flutter_assignment/Helper/colors.dart';
import 'package:flutter_assignment/service/push_notification_service.dart';
import 'component/app_btn.dart';
import 'package:sizer/sizer.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    NotificationService.setUpFirebase();

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
           onPress: (){NotificationService.sendFcmMessage("helllo", "ddddddddd");},
         ),
         SizedBox(height:6.h ,),

         AppButton(
           btnColor: AppColors.Pink,
           btnTitle: "Bye",
           onPress: (){print("Bye");},
         ),
       ],
     ),
   )
    );
  }
}
