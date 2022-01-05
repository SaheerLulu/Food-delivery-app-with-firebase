import 'package:flutter_application_1/models/food.dart';

class Restaurant {
  String name;
  String waitTime;
  String distance;
  String label;
  String logoUrl;
  String desc;
  num score;
  Map<String ,List<Food>> menu;
  Restaurant(
    this.name,
    this.waitTime,
    this.distance,
    this.label,
    this.logoUrl,
    this.desc,
    this.score,
    this.menu
  );

static Restaurant generateRestaurant(){
  return Restaurant(
    "Kasim's Biriyani", 
    "20-30 min", 
    "2.4 km", 
    "Restuarant", 
    "assets/images/res_logo.png", 
    "The Biriyani house", 
    4.7, 
    {
      'Recommend':Food.generateRecommendFoods(),
      'Popular':[],
      'Noodles':[],
      'Pizza':[]
    });
}

}