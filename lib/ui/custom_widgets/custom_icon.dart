import 'package:flutter/material.dart';
import 'package:juiceapp/constants/colors.dart';

class CustomIconAllPages extends StatelessWidget {

  final double width;
  final double height;
  final Color color;
  final Widget child;
  CustomIconAllPages({this.width, this.height,this.child,this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: child
    );
  }
}
