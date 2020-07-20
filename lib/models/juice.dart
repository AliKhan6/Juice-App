import 'package:flutter/cupertino.dart';

class Juice{
   String title;
   String description;
   var price;
   String image;
   Color color;
   int index = 0;

  Juice({this.title, this.description, this.price, this.image,this.color,this.index});
  int incrementIndex() => index += 1;
}

