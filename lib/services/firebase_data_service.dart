import 'package:juiceapp/constants/colors.dart';
import 'package:juiceapp/models/fruits.dart';
import 'package:juiceapp/models/juice.dart';

class FirebaseDataService {
  
  /// Scrollable body items
  /// 
  Juice appleJuice = Juice(
      title: 'Apple',
      description: 'Almost every designer awaitos their turn and chance work own big food',
      price: 12.76,
      image: 'images/red_lemonade.jpg',
      color: redColor);

  Juice pineappleJuice = Juice(
      title: 'Pineapple',
      description: 'Almost every designer awaitos their turn and chance work own big food',
      price: 13.06,
      image: 'images/yellow_lemonade.jpeg',
      color: yellowColor);

  Juice grapesJuice = Juice(
      title: 'Grapes',
      description: 'Almost every designer awaitos their turn and chance work own big food',
      price: 11.00,
      image: 'images/grey_lemonade.jpeg',
      color: greyColor);

  Juice apple = Juice(
      title: 'Banana',
      description: 'Almost every designer awaitos their turn and chance work own big food',
      price: 23.98,
      image: 'images/red_lemonade.jpg',
      color: redColor);

  List<Juice> juiceDataList = [];
  
  Future getJuices() async {
    Future.delayed(Duration(seconds: 20));
    juiceDataList.add(appleJuice);
    juiceDataList.add(pineappleJuice);
    juiceDataList.add(grapesJuice);
    juiceDataList.add(apple);
    return juiceDataList;
  }


  /// Custom AppBar items
  /// 
  Fruit avocado = Fruit(name: 'Avocado', image: 'images/avocado.jpeg');
  Fruit mango = Fruit(name: 'Mango', image: 'images/mango.jpeg');
  Fruit fruitApple = Fruit(name: 'Apple', image: 'images/apple.jpeg');
  Fruit grapes = Fruit(name: 'Grapes', image: 'images/grapes.jpeg');
  Fruit banana = Fruit(name: 'Banana', image: 'images/banana.jpeg');
  Fruit avocados = Fruit(name: 'Avocado', image: 'images/avocado.jpeg');

  List<Fruit> fruitsDataList = [];
  
  Future getFruits() async{
    Future.delayed(Duration(seconds: 20));
    fruitsDataList.add(avocado);
    fruitsDataList.add(mango);
    fruitsDataList.add(fruitApple);
    fruitsDataList.add(grapes);
    fruitsDataList.add(banana);
    fruitsDataList.add(avocado);
    fruitsDataList.add(avocado);
    return fruitsDataList;
  }

}
