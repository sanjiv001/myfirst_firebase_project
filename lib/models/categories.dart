import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category {
  String? name;
  IconData? icon;
  Category({@required this.name, @required this.icon});
}

List<Category> categories = [
  Category(
    name: 'Apartments',
    icon: FontAwesomeIcons.houseChimneyUser,
  ),
  Category(
    name: 'Rooms',
    icon: FontAwesomeIcons.cartFlatbedSuitcase,
  ),
  Category(
    name: 'Buildings',
    icon: FontAwesomeIcons.house,
  ),

];