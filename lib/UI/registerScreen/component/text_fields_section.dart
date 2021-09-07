import 'package:flutter/material.dart';
import 'package:flutter_assignment/Controllers/register_controller.dart';
import 'package:flutter_assignment/Helper/widgets/app_text_field.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:sizer/sizer.dart';



class TextFieldSection extends StatelessWidget {
  const TextFieldSection({Key? key,required this.registerController}) : super(key: key);
  final RegisterController registerController;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SizedBox(height: 3.h),
        AppTextField(
          label: "Name",
       validate: "name",
          focusNode: registerController.nameNode,
          textEditingController: registerController.name,


        ),
        SizedBox(height: 4.h),
        AppTextField(
          label: "Email",
          validate: "email",
          focusNode: registerController.emailNode,
          textEditingController: registerController.email,


        ),
        SizedBox(height: 4.h),
        AppTextField(
          label: "Password",
          validate: "password",
          focusNode: registerController.passwordNode,
          textEditingController: registerController.password,


        ),
        SizedBox(height: 4.h),

        AppTextField(
          label: "Phone",
          validate: "phone",
          focusNode: registerController.phoneNode,
          textEditingController: registerController.phone,

        ),
        SizedBox(height: 7.h),
      ],
    );
  }

}
