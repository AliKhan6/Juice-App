import 'package:flutter/material.dart';
import 'package:juiceapp/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final hintText;
  final controller;
  final icon;
  final onChange;
  CustomTextField({this.hintText,this.controller,this.icon,this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChange,
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: TextStyle(color: redColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide.none,
        ),
        suffixIcon: icon,
      ),
    );
  }
}