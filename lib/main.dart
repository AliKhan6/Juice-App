import 'package:flutter/material.dart';
import 'package:juiceapp/constants/colors.dart';
import 'package:juiceapp/ui/screens/juices_list_screen.dart';
import 'package:provider/provider.dart';
import 'models/juices_model;.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<JuicesModel>(
        create: (context) => JuicesModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            accentColor: redColor
        ),
        title: 'Juice App',
        home: JuicesListScreen(),
      ),
    );
  }
}


