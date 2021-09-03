import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../colors.dart';
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

  const AppTextField(
      {Key? key,
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
        this.contetntPadding})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      child: TextFormField(
        scrollPadding: EdgeInsets.all(10),
        maxLines: maxLines,
        onFieldSubmitted: onFieldSubmitted,
        validator: (value) {
          if (value!.trim().length == 0) {
            return validation;
          }
          return null;
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

          labelText: label,
          isDense: true,
          contentPadding: contetntPadding == null
              ? EdgeInsets.fromLTRB(0, 8, 0, 8)
              : EdgeInsets.fromLTRB(12, 15, 12, 15),
          //  EdgeInsets.fromLTRB(12, 15, 12, 15),
          hintStyle:TextStyle(
            fontSize: 11.0.sp,
            fontWeight: FontWeight.w500,
          ),

        ),

      ),
    );
  }
}
