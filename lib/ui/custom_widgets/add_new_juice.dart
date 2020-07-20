import 'package:flutter/material.dart';
import 'package:juiceapp/constants/colors.dart';
import 'package:juiceapp/constants/text_style.dart';
import 'package:juiceapp/models/juices_model;.dart';
import 'package:provider/provider.dart';
import 'custom_text_field.dart';

/// Add New Juice Flavour

class AddNewJuice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<JuicesModel>(
      builder: (context,model,child){
        return Drawer(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Center(
                      child: Text(
                        'Add New Juice ',
                        style: drawerTitle,
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Name: ',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  CustomTextField(
                    hintText: 'Enter name',
                    onChange: (value) {
                      model.newJuice.title = value;
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Description: ',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  CustomTextField(
                    hintText: 'Enter short description',
                    onChange: (value) {
                      model.newJuice.description = value;
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Price: ',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  CustomTextField(
                    hintText: 'Enter price',
                    onChange: (value) {
                      model.newJuice.price = value;
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Image Url: ',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  CustomTextField(
                    hintText: 'Enter image url',
                    onChange: (value){
                      model.newJuice.image = value;
                    },
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  FlatButton(
                    onPressed: () {
                      model.addNewJuice();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: redColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      alignment: Alignment.center,
                      child: Text('SAVE', style: customButtonTextStyle),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


