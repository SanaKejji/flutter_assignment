import 'package:flutter/material.dart';
import 'package:flutter_assignment/Controllers/login_controller.dart';
import 'package:flutter_assignment/Helper/widgets/app_text_field.dart';
import 'package:sizer/sizer.dart';
class TextFieldPart extends StatelessWidget {
  const TextFieldPart({Key? key,required this.loginController,}) : super(key: key);
 final LoginController loginController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          label: "Email",
          validate: 'email',
          color: Colors.grey,
          textEditingController: loginController.email,
          focusNode: loginController.emailNode,
        ),
        SizedBox(height:4.h),

        AppTextField(
          label: "Password",
          validate: 'password',
          color: Colors.grey,
          textEditingController: loginController.password,
          focusNode: loginController.passwordNode,

        ),
      ],
    );
  }
}
