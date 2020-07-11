import 'package:flutter/material.dart';
import 'package:juiceapp/constants/decoration.dart';

class CustomIconAllPages extends StatelessWidget {

  final double width;
  final double height;
  final IconData icon;
  CustomIconAllPages({this.width, this.height,this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: iconsDecoration,
      child: IconButton(icon: Icon(icon,size: 35.0,),color: Colors.white,onPressed: (){},),
    );
  }
}
