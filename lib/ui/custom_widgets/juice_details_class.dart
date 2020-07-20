import 'package:juiceapp/constants/colors.dart';

class JuiceDetailsClass{
  final title;
  final description;
  final price;
  final image;
  final color;
  JuiceDetailsClass({this.title,this.description,this.price,this.image,this.color});
}

List<JuiceDetailsClass> juiceDetails = [appleJuice,grapesJuice,pineappleJuice,appleJuices];

final JuiceDetailsClass appleJuice = JuiceDetailsClass(
    title: 'Apple',
    description: 'Almost every designer awaitos their turn and chance work own big food',
  price: '12.65',
  image: 'images/red_lemonade.jpg',
  color: redColor
);

final JuiceDetailsClass grapesJuice = JuiceDetailsClass(
  title: 'Grapes',
  description: 'Almost every designer awaitos their turn and chance work own big food',
  price: '11.27',
  image: 'images/grey_lemonade.jpeg',
  color: greyColor
);

final JuiceDetailsClass pineappleJuice = JuiceDetailsClass(
  title: 'Pineapple',
  description: 'Almost every designer awaitos their turn and chance work own big food',
  price: '13.99',
  image: 'images/yellow_lemonade.jpeg',
  color: yellowColor
);

final JuiceDetailsClass appleJuices = JuiceDetailsClass(
    title: 'Apple',
    description: 'Almost every designer awaitos their turn and chance work own big food',
    price: '12.65',
    image: 'images/red_lemonade.jpg',
    color: redColor
);