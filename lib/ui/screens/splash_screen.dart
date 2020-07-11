import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juiceapp/constants/colors.dart';
import 'package:juiceapp/constants/decoration.dart';
import 'package:juiceapp/constants/text_style.dart';
import 'package:juiceapp/ui/custom_widgets/custom_icon_all_pages.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final spaceBetweenJuicesAndPics = MediaQuery.of(context).size.height*0.03;

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      /// Search bar and fruits list
                      Container(
                        height: MediaQuery.of(context).size.height*0.3,
                        padding: EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0)),
                          color: redColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: 'Search Juice Name',
                                          hintStyle: TextStyle(color: redColor),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                            borderSide: BorderSide.none,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                            borderSide: BorderSide.none,
                                          ),
                                          suffixIcon: Icon(Icons.search,color: redColor,)
                                      ),
                                    )
                                ),
                                SizedBox(width: 15.0,),
                                CustomIconAllPages(width: MediaQuery.of(context).size.width/6.2, height: MediaQuery.of(context).size.height*0.08,icon: Icons.more_vert,)
                              ],
                            ),

                            /// Fruits Horizontal list
                            Container(
                              height: MediaQuery.of(context).size.height*0.12,
                              child: ListView(
                                shrinkWrap: false,
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  FruitsHorizontalList(image: 'images/avocado.jpeg',text: 'Avocado',),
                                  FruitsHorizontalList(image: 'images/mango.jpeg',text: 'Mango',),
                                  FruitsHorizontalList(image: 'images/apple.jpeg',text: 'Apple',),
                                  FruitsHorizontalList(image: 'images/grapes.jpeg',text: 'Grapes',),
                                  FruitsHorizontalList(image: 'images/banana.jpeg',text: 'Banana',),
                                  FruitsHorizontalList(image: 'images/apple.jpeg',text: 'Apple',),
                                  FruitsHorizontalList(image: 'images/grapes.jpeg',text: 'Grapes',),
                                  FruitsHorizontalList(image: 'images/banana.jpeg',text: 'Banana',)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),


                  /// Fruits Detail List
                  ///
                  SizedBox(height: spaceBetweenJuicesAndPics),
                  Container(
                    height: MediaQuery.of(context).size.height*0.62,
                    child: ListView(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0, right: 8.0),
                                child: Column(
                                  children: <Widget>[

                                    SizedBox(height: spaceBetweenJuicesAndPics),
                                    JuiceDetailList(title: 'Apple Juice',description: 'Almost every designer awaitos their turn and chance work own big food',price: '12.65',),

                                    SizedBox(height: spaceBetweenJuicesAndPics),
                                    JuiceDetailList(title: 'Apple Juice',description: 'Almost every designer awaitos their turn and chance work own big food',price: '12.65',),

                                    SizedBox(height: spaceBetweenJuicesAndPics),
                                    JuiceDetailList(title: 'Apple Juice',description: 'Almost every designer awaitos their turn and chance work own big food',price: '12.65',),

                                    SizedBox(height: spaceBetweenJuicesAndPics),
                                    JuiceDetailList(title: 'Apple Juice',description: 'Almost every designer awaitos their turn and chance work own big food',price: '12.65',),
                                  ],
                                ),
                              ),
                            ),

                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(top: 20),
                                decoration: BoxDecoration(
                                  color: backgroundColor,
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0)),
                                ),
                                child: Column(
                                  children: <Widget>[

                                    JuicePicsList(image: 'images/red_lemonade.jpg',),
                                    SizedBox(height: spaceBetweenJuicesAndPics),

                                    JuicePicsList(image: 'images/grey_lemonade.jpeg',),
                                    SizedBox(height: spaceBetweenJuicesAndPics),

                                    JuicePicsList(image: 'images/yellow_lemonade.jpeg',),
                                    SizedBox(height: spaceBetweenJuicesAndPics),

                                    JuicePicsList(image: 'images/red_lemonade.jpg',),
                                    SizedBox(height: spaceBetweenJuicesAndPics)
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),


          )
      ),
    );
  }
}

class JuicePicsList extends StatelessWidget {

  final image;
  JuicePicsList({this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
        child: Image.asset(image ,width: 120.0,height: 120,
        fit: BoxFit.cover,),
    );
  }
}

class JuiceDetailList extends StatelessWidget {

  final title;
  final description;
  final price;
  JuiceDetailList({this.title, this.description, this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title , style: juiceTitleAndPrice),
        Padding(
          padding: const EdgeInsets.only(top: 6.0,bottom: 6.0),
          child: Text(description ,style: TextStyle(fontSize: 10.0),),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Text('\$',style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.bold),),
                  Text(price ,style: juiceTitleAndPrice),

                ],
              ),
            ),
              Expanded(
                child: Container(
                 height: 35.0,
                  decoration: buttonsDecoration,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(onTap: (){}, child: Icon(Icons.remove,color: Colors.white, size: 15.0,)),
                      Text('1',style: TextStyle(color: Colors.white,fontSize: 15.0),),
                      GestureDetector(onTap: (){},child: Icon(Icons.add,color: Colors.white, size: 15.0,)),
                    ],
                  ),
                ),
              )

          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.035),
      ],
    );
  }
}

class FruitsHorizontalList extends StatelessWidget {

  final String text;
  final String image;
  FruitsHorizontalList({this.text, this.image});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width/6.2;
    final height = MediaQuery.of(context).size.height*0.08;

    return Padding(
      padding: const EdgeInsets.only(left: 10.0,right: 10.0),
      child: Column(
        children: <Widget>[
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(child: Image.asset(image,width: 55.0,height: 55.0,)),
          ),

          SizedBox(height: 10.0,),
          Text(text , style: TextStyle(color: Colors.white,fontSize: 15.0),)
        ],
      ),
    );
  }
}

