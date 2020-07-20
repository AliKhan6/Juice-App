import 'package:flutter/material.dart';
import 'package:juiceapp/constants/colors.dart';
import 'juice.dart';



class JuicesModel extends ChangeNotifier{

  bool favourite = false;
  int juiceCount = 1;

  Juice newJuice = Juice();

  List<Juice> juices = [
    Juice(
        title: 'Apple',
        description: 'Almost every designer awaitos their turn and chance work own big food',
        price: 12.76,
        image: 'images/red_lemonade.jpg',
        color: redColor,
      index: 0
    ),
    Juice(
        title: 'Pineapple',
        description: 'Almost every designer awaitos their turn and chance work own big food',
        price: 13.06,
        image: 'images/yellow_lemonade.jpeg',
        color: yellowColor,
      index: 1
    )
  ];

  void addNewJuice() {
    juices.add(newJuice);
    newJuice.index = newJuice.incrementIndex();
    notifyListeners();
    newJuice = Juice();
  }

  void updateFavourite(){
    favourite = favourite == false ? true : false;
    notifyListeners();
  }

  void increaseJuiceCount(int index){
      index == newJuice.index ? juiceCount = juiceCount != 0 ? juiceCount += 1 : juiceCount = 1 : juiceCount = 1;
      print(newJuice.index);
    notifyListeners();
  }

  void decreaseJuiceCount(int index){
    index == newJuice.index ? juiceCount = juiceCount != 0 ? juiceCount -= 1 : juiceCount = 0 : juiceCount =1 ;
    print(newJuice.index);
    notifyListeners();
  }

  void deleteJuice(int index){
    juices.removeAt(index);
    notifyListeners();
  }
}