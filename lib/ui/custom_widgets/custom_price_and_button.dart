import 'package:flutter/material.dart';
import 'package:juiceapp/constants/colors.dart';
import 'package:juiceapp/models/juices_model;.dart';
import 'package:provider/provider.dart';


class CustomPriceAndButton extends StatelessWidget {

  final price;
  final color;
  final textStyle;
  final index;
  CustomPriceAndButton({this.price, this.color,this.textStyle,this.index});

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Text('\$',style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.bold),),
              Text(price.toString() ,style: textStyle),

            ],
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width/3.5,
            height: 42.0,
            decoration: BoxDecoration(
              color: yellowColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Consumer<JuicesModel>(
              builder: (context, model, child){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          GestureDetector(onTap: (){
                            model.decreaseJuiceCount(index);
                          }, child: Icon(Icons.remove,color: Colors.white, size: 15.0,)),
                          Text('${model.juiceCount}',style: TextStyle(color: Colors.white,fontSize: 15.0),),
                          GestureDetector(onTap: (){
                            model.increaseJuiceCount(index);
                          },child: Icon(Icons.add,color: Colors.white, size: 15.0,)),
                        ],
                      );
              },
            )
        )
      ],
    );
  }
}
