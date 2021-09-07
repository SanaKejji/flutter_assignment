import 'dart:io';
import 'package:flutter_assignment/Api/register_api.dart';
import 'package:flutter_assignment/Helper/constant/FCM_token.dart';
import 'package:flutter_assignment/Models/user_model.dart';
import 'package:flutter_assignment/UI/homeScreen/homeScreen.dart';
import 'package:flutter_assignment/service/local_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cross_file/cross_file.dart';
import 'package:flutter_assignment/Helper/colors.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController with StateMixin<bool> {
  final formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();

  FocusNode nameNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode phoneNode = FocusNode();

  FocusNode passwordNode = FocusNode();
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(6, errorText: 'password must be at least 6 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);
  final emailValidator =
      EmailValidator(errorText: 'enter a valid email address');
  final nameValidator = RequiredValidator(errorText: 'password is required');
  bool isThereImg = false;
  final ImagePicker _picker = ImagePicker();
  File? _image;
  //bool isLoading = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    change(true, status: RxStatus.success());

  }

  onClickRegister(BuildContext context) {
    if (formKey.currentState!.validate())
      showDialog(
        context: context,
        builder: (_) {
          return new AlertDialog(
            title: Text("Add your profile image to complete registration"),
            content: TextButton.icon(
              icon: Icon(Icons.photo),
              style: TextButton.styleFrom(
                primary: AppColors.DarkBlue,
              ),
              label: Text("+ ADD IMAGE"),
              onPressed: () {
                imgFromGallery();
              },
            ),
            actions: [
              new TextButton(
                child: new Text("Continue"),
                style: TextButton.styleFrom(
                  primary: AppColors.Blue,
                ),
                onPressed: () {
                  onClickContinue();
                },
              ),
              new TextButton(
                style: TextButton.styleFrom(
                  primary: AppColors.Blue,
                ),
                child: new Text("Cancel"),
                onPressed: () {
                  //make img null
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    //else return;
  }

  onClickLogin() {
    Get.back();
  }

  onClickContinue() async {
    if (_image == null)
      Fluttertoast.showToast(
          msg: "Add Your Profile Image",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    else {
//save object
      var user = User(
        email: email.text,
        fcmToken: fcmToken!,
        password: password.text,
        name: name.text,
        phone: phone.text,
        userImg: "_image",
      );

      Get.back();
    final bool? r =await  RegisterApi().uploadToServer(
        _image!,
        user,
      );
    if (r! == true)
     {
     SharedPref().save("user", user);
     Get.offAll(HomeScreen());}

    else {
    }
    }
  }

  imgFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    _image = File(image!.path);
  }
}
