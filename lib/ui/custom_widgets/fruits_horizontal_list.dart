import 'package:flutter/material.dart';


class FruitsHorizontalList extends StatelessWidget {
  final String text;
  final String image;

  FruitsHorizontalList({this.text, this.image});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 6.2;
    final height = MediaQuery.of(context).size.height * 0.08;

    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        children: <Widget>[
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
                child: Image.asset(
                  image,
                  width: 55.0,
                  height: 55.0,
                )),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(text, style: TextStyle(color: Colors.white, fontSize: 15.0),)
        ],
      ),
    );
  }
}