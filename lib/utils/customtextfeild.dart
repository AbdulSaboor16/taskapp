import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskapp/utils/color_contraints.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final InputDecoration decoration;
  final String text;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.decoration,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final RxBool isObscure = true.obs;
    return TextField(
      cursorColor: ColorConstraint.greyColor,
      controller: controller,
      // obscureText: isObscure.value,
      decoration: InputDecoration(
        // suffixIcon: IconButton(
        //   onPressed: () =>
        //       isObscure.toggle(), // Toggle visibility on button press
        //   icon: Icon(
        //     isObscure.value ? Icons.visibility : Icons.visibility_off,
        //     color: ColorConstraint.greyColor,
        //   ),
        // ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: ColorConstraint.greyColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: ColorConstraint.greyColor,
          ),
        ),
        filled: true,
        hintStyle: TextStyle(color: ColorConstraint.greyColor),
        hintText: text,
        fillColor: Colors.white70,
      ),
    );
  }
}
