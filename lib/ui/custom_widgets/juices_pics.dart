import 'package:flutter/material.dart';

class JuicesPics extends StatelessWidget {
  final image;
  final index;

  JuicesPics({this.image,this.index});

  @override
  Widget build(BuildContext context) {
    return index <= 1 ? ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(image,width: 120,height: 120,fit: BoxFit.cover,)),
    ) :
    ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.network(image,width: 120,height: 120,fit: BoxFit.cover,)),
    );
  }
}