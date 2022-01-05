import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/models/restaurant.dart';
import 'package:flutter_application_1/screens/home/widget/food_list.dart';
import 'package:flutter_application_1/screens/home/widget/food_list_view.dart';
import 'package:flutter_application_1/screens/home/widget/restaurant_info.dart';
import 'package:flutter_application_1/widget/custom_app_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  
  
 
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  var selected =0;
  final restaurant = Restaurant.generateRestaurant();
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    print("home page loaded");
    return Scaffold(
      backgroundColor: kBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          CustomAppBar(
            Icons.arrow_back_ios_new_outlined,
            Icons.search_outlined
          ),
          RestaurantInfo(),
          FoodList(
            selected,
            (int index){
              setState(() {
                selected=index;
              });
              pageController.jumpToPage(index);
            }, 
            restaurant
          ),
         Expanded(
           child:FoodListView(
             selected,
             (int index){
               setState(() {
                 selected=index;
               });
             },
             pageController,
             restaurant,
           
           )
         
         ), 
         Container(
           padding: EdgeInsets.symmetric(horizontal: 25),
           height: 60,
           child: SmoothPageIndicator(
             controller: pageController,
             count: restaurant.menu.length,
             effect:CustomizableEffect(
               dotDecoration: DotDecoration(
                 width: 8,
                 height: 8,
                 color: Colors.grey.withOpacity(0.5),
                 borderRadius: BorderRadius.circular(8),

               ) ,
               activeDotDecoration: DotDecoration(
                 width: 10,
                 height: 10,
                 color:   Colors.grey.withOpacity(0.1),
                 borderRadius: BorderRadius.circular(10),
                 dotBorder: DotBorder(
                   color: kPrimaryColor,
                   padding: 2,
                   width: 2,
                 ),
                 
               ) , ),
               onDotClicked:(index)=> pageController.jumpToPage(index) ,

             ),

         ),
        ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:(){},
          backgroundColor: kPrimaryColor,
          elevation: 2,
          child: Icon(
            Icons.shopping_bag_outlined,
            color: Colors.black,
            size: 30,
          ),
          
          ),
      
    );
  }
}