import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/models/restaurant.dart';
import 'package:flutter_application_1/services/adding_data.dart';
import 'package:flutter_application_1/services/reading_data.dart';

class FoodListTest extends StatelessWidget {
   int selected=0;
  // final Function callback;
  // final Restaurant restaurant;

  // FoodListTest(tghis.selected,this.callback,this.restaurant);

  Future<List<String>> category = ReadingData.getAllDocs() ;
  

  @override
  Widget build(BuildContext context) { 
  
    return FutureBuilder<List<String>>(
      future: category,
      builder: (context,snapshot){
        if(snapshot.connectionState != ConnectionState.done) {
        // return: show loading widget
        return Container();
      }
      if(snapshot.hasError) {
        return Container();
      }
      List<String> categories = snapshot.data ?? [];
    
      
      return Container(
        
        height: 80,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 25),
          scrollDirection: Axis.vertical,
          itemBuilder: (context,index) => GestureDetector(
            onTap: () => (int index){
                
                  selected=index;
                },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: selected ==index ? kPrimaryColor : Colors.white,
              ),
              child:Text(
                categories[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  
                ),
              ),
          
            ),
          ), 
          separatorBuilder: (_,index) => SizedBox(height: 20,), 
          itemCount: categories.length),
        
      );
      });
  }
}