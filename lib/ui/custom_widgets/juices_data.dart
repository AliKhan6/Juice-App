import 'package:flutter/material.dart';
import 'package:juiceapp/constants/text_style.dart';
import 'custom_price_and_button.dart';


class JuicesData extends StatelessWidget {
  final title;
  final description;
  final price;
  final color;
  final index;

  JuicesData({this.title, this.description, this.price, this.color,this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('$title Juice', style: splashScreenTitleAndPrice),
        Padding(
          padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
          child: Text(
            description,
            style: TextStyle(fontSize: 12.0, color: Colors.grey[700]),
          ),
        ),
        CustomPriceAndButton(
          price: price,
          color: color,
          textStyle: splashScreenTitleAndPrice,
          index: index,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.024),
      ],
    );
  }
}