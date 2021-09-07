import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:sizer/sizer.dart';
import '../colors.dart';

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'password is required'),
  MinLengthValidator(6, errorText: 'password must be at least 6 digits long'),
  PatternValidator(r'(?=.*?[#?!@$%^&*-])',
      errorText: 'passwords must have at least one special character')
]);
final emailValidator = EmailValidator(errorText: 'enter a valid email address');
final nameValidator = RequiredValidator(errorText: 'password is required');

class AppTextField extends StatelessWidget {
  final String? label;
  final String? validation;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final onFieldSubmitted;
  final int? maxLines;
  final double? padding;
  final EdgeInsetsGeometry? contetntPadding;
  final String validate;
  final Color color;
  const AppTextField({
    Key? key,
    this.label,
    this.validation,
    this.textEditingController,
    this.focusNode,
    this.keyboardType,
    this.obscureText = false,
    this.textInputAction,
    this.onFieldSubmitted,
    this.maxLines = 1,
    this.padding,
    this.contetntPadding,
    required this.validate, this.color= AppColors.White,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85.w,
      child: TextFormField(
        scrollPadding: EdgeInsets.all(10),
        maxLines: maxLines,
        onFieldSubmitted: onFieldSubmitted,
        validator: (val) {
          if (validate == "email") {
            bool emailValid = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(val!);

            if (!emailValid || val!.trim().length == 0)
              return 'Enter a valid email address';
            else
              return null;
          }

          if (validate == "phone") {
            if (val!.trim().length != 10)
              return ' phone number must consist of 10 digits';
            else
              return null;
          }

          if (validate == "password") {
            print(val!.length);
            if (val!.length < 6)
              return ' password length should be at least 6';
            else
              return null;
          }

          if (validate == "name") {
            if (val!.trim().length == 0)
              return ' this field is required';
            else
              return null;
          }
        },
        obscureText: obscureText!,
        controller: textEditingController,
        focusNode: focusNode,
        cursorWidth: 1,
        textInputAction: textInputAction,
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: keyboardType,
        style: TextStyle(
          fontSize: 11.0.sp,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
//focusColor: AppColors.DarkBlue,
          enabledBorder:  UnderlineInputBorder(
            borderSide:  BorderSide(color: color, width: 1.0),
          ),
          labelText: label,
          labelStyle: TextStyle(
              fontSize: 11.0.sp,
              fontWeight: FontWeight.w500,
              color: color),
          isDense: true,
          contentPadding: contetntPadding == null
              ? EdgeInsets.fromLTRB(0, 8, 0, 8)
              : EdgeInsets.fromLTRB(12, 15, 12, 15),
          //  EdgeInsets.fromLTRB(12, 15, 12, 15),
        ),
      ),
    );
  }
}
