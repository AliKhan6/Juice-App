import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juiceapp/constants/colors.dart';
import 'package:juiceapp/models/fruits.dart';
import 'package:juiceapp/models/juice.dart';
import 'package:juiceapp/models/juices_model;.dart';
import 'package:juiceapp/ui/custom_widgets/add_new_juice.dart';
import 'package:juiceapp/ui/custom_widgets/custom_text_field.dart';
import 'package:juiceapp/ui/custom_widgets/fruits_horizontal_list.dart';
import 'package:juiceapp/ui/custom_widgets/custom_icon.dart';
import 'package:juiceapp/services/firebase_data_service.dart';
import 'package:juiceapp/ui/custom_widgets/juices_data.dart';
import 'package:juiceapp/ui/custom_widgets/juices_pics.dart';
import 'package:provider/provider.dart';
import 'juice_detail_screen.dart';

class JuicesListScreen extends StatefulWidget {

  @override
  _JuicesListScreenState createState() => _JuicesListScreenState();
}

class _JuicesListScreenState extends State<JuicesListScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController filterController = TextEditingController();
  String filter;

  /// variable for getting data
  bool getData = false;

  /// Fruits List
  List<Fruit> fruits = [];

  @override
  void initState() {
    _getJuicesAndFruits();
    filterController.addListener(() {
      setState(() {
        filter = filterController.text;
      });
    });
    super.initState();
  }

  _getJuicesAndFruits() async {
//    juices = await FirebaseDataService().getJuices();
    fruits = await FirebaseDataService().getFruits();

    setState(() {
      if (fruits.isEmpty) {
        getData = false;
      } else {
        getData = true;
      }
    });
  }

  @override
  void dispose() {
    filterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final model = Provider.of<JuicesModel>(context,listen: false);

    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            drawer: AddNewJuice(),
            body: Stack(
              children: <Widget>[
                /// Scrollable
                scrollableBody(context, model),

                customAppBar(context , model),
              ],
            )));
  }

  scrollableBody(context, model) {
    return Padding(
      padding: EdgeInsets.only(top: 230),
      child: Container(
            padding: EdgeInsets.only(top: 0),
            child: getData == false
                ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: redColor,
                ))
                : ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: model.juices.length,
                itemBuilder: (BuildContext context, int index) {
                  return filter == null || filter == ""
                      ? GestureDetector(
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            title: Text('Are you sure to delete the item.', style: TextStyle(fontSize: 15.0),),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('cancel',style: TextStyle(color: Colors.white),),
                                color: greyColor,
                              ),
                              FlatButton(
                                onPressed: () {
                                  model.deleteJuice(index);
                                  Navigator.pop(context);
                                },
                                child: Text('delete',style: TextStyle(color: Colors.white),),
                                color: redColor,
                              )
                            ],
                          );
                        }
                      );
                    },
                      child: juicesDataAndImage(model.juices[index], index))
                      : model.juices[index].title.contains(filter)
                      ? GestureDetector(
                    onLongPress: () => model.deleteJuice(index),
                      child: juicesDataAndImage(model.juices[index], index))
                      : Container();
                }),
          ),
    );
  }

  customAppBar(context, model) {
    return Column(
      children: <Widget>[
        /// Search bar and fruits list
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0)),
            color: redColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: CustomTextField(
                    hintText: 'Search Juice Name ',
                    controller: filterController,
                    icon: Icon(
                      Icons.search,
                      color: redColor,
                    ),
                  )),
                  SizedBox(
                    width: 15.0,
                  ),
                  CustomIconAllPages(
                      color: backgroundColor,
                      width: 58,
                      height: 58,
                      child: IconButton(
                        onPressed: () => _scaffoldKey.currentState.openDrawer(),
                        icon: Icon(
                          Icons.more_vert,
                          size: 35.0,
                          color: Colors.white,
                        ),
                      ))
                ],
              ),

              /// Fruits Horizontal list
              Container(
                height: 90.0,
                child:
                getData == false
                    ? CircularProgressIndicator(
                        backgroundColor: yellowColor,
                      )
                    :
                ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: fruits.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return FruitsHorizontalList(
                            image: fruits[index].image,
                            text: fruits[index].name,
                          );
                        }),
              )
            ],
          ),
        ),
      ],
    );
  }

  /// Scrollable data
  Widget juicesDataAndImage(juice, index) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 8.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                JuicesData(
                  title: juice.title,
                  description: juice.description,
                  price: juice.price,
                  color: juice.color,
                  index: index,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 15),
            decoration: index == 0
                ? BoxDecoration(
                    color: backgroundColor,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(30.0)),
                  )
                : BoxDecoration(
                    color: backgroundColor,
                  ),
            child: Column(
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JuiceDetailScreen(
                                    detailScreenTitle: juice.title,
                                    detailScreenDescription: juice.description,
                                    detailScreenPrice: juice.price,
                                    detailScreenImage: juice.image,
                                    detailScreenColor: juice.color,
                                    detailScreenIndex: index,
                                  )));
                    },
                    child: JuicesPics(
                      image: juice.image,
                      index: index,
                    )),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              ],
            ),
          ),
        )
      ],
    );
  }
}
