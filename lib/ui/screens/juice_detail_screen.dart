import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juiceapp/constants/colors.dart';
import 'package:juiceapp/constants/text_style.dart';
import 'package:juiceapp/models/juices_model;.dart';
import 'package:juiceapp/ui/custom_widgets/custom_icon.dart';
import 'package:juiceapp/ui/custom_widgets/custom_price_and_button.dart';
import 'package:provider/provider.dart';


class JuiceDetailScreen extends StatelessWidget {

  final detailScreenTitle;
  final detailScreenDescription;
  final detailScreenPrice;
  final detailScreenImage;
  final detailScreenColor;
  final detailScreenIndex;
  JuiceDetailScreen({this.detailScreenTitle, this.detailScreenDescription, this.detailScreenPrice, this.detailScreenImage,this.detailScreenColor,this.detailScreenIndex});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[

            /// Upper half screen
            picAndIconsHalfScreen(context),

            /// Lower Half Screen
            juiceDetailsHalfScreen(context),

          ],
        ),
      ),
    );
  }

  Widget picAndIconsHalfScreen(context){
    return Container(
      height: MediaQuery.of(context).size.height*0.48,
      child: Stack(
        children: <Widget>[
          Container(
            constraints: new BoxConstraints.expand(
              height: MediaQuery.of(context).size.height*0.45,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.0),bottomRight: Radius.circular(40.0)),
                image: DecorationImage(
                  image: detailScreenIndex <=1 ? AssetImage(detailScreenImage) : NetworkImage(detailScreenImage),
                  fit: BoxFit.cover,
                )
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomIconAllPages(
                  color: backgroundColor,
                  width: 40,
                  height: 40,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios,size: 25.0,color: Colors.white,),
                    onPressed: () => Navigator.pop(context),
                  ),),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: IconButton(icon: Icon(Icons.more_vert,size: 35,color: Colors.white,),
                      onPressed: (){},
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      elevation: 8.0,
                      color: detailScreenColor,
                      shadowColor: redColor,
                      child: CustomIconAllPages(
                          color: Colors.white,
                          width: 55,
                          height: 55,
                          child: Consumer<JuicesModel>(
                            builder: (context, model, child){
                              return IconButton(
                                icon: model.favourite == true ? Icon(Icons.favorite,size: 30.0,color: redColor,) :
                                Icon(Icons.favorite_border,size: 30.0,color: redColor,),
                                onPressed: () {
                                  model.updateFavourite();
                                },
                              );
                            },
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget juiceDetailsHalfScreen(context){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Tangerine $detailScreenTitle',style: detailScreenTitleAndPrice),
          Text('Lemonade Juice',style: TextStyle(fontSize: 18.0,color: Colors.grey[700]),),

          SizedBox(height: 25.0,),
          CustomPriceAndButton(price: detailScreenPrice, color: detailScreenColor,textStyle: detailScreenTitleAndPrice),
          SizedBox(height: 25.0,),

          Text('About Product',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
          SizedBox(height: 25.0,),

          Text('$detailScreenDescription This was mine so cherished the opportunity to make my mark expanding.',
            style: TextStyle(fontSize: 12.0,color: Colors.grey[700]),),
          SizedBox(height: 25.0,),

          FlatButton(
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: yellowColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              alignment: Alignment.center,
              child: Text('Add to Blog',style: customButtonTextStyle),
            ),
          )
        ],
      ),
    );
  }
}



