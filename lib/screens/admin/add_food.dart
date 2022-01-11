import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/food.dart';

class AddFood extends StatelessWidget {
  List<Food> food = Food.generateRecommendFoods();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView.separated(
        itemBuilder: (ctx, ind) {
          String key = food.elementAt(0).toMap().keys.elementAt(ind);
          print(food[0].toMap().length);
          return Container(
              width: double.infinity,
              child: Column(
                
                mainAxisAlignment: MainAxisAlignment.start,
                
               children: [
                 Row(

                   children: [
                   
                   Expanded(
                     flex: 1,
                     child: Container(
                       
                       child:Text(key)),
                   ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity/2,
                
                child: TextFormField(
                  
                  decoration: InputDecoration(
                    
                      hintText: key,
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none),
                ),
              ),
            ),
                 ],)
            
          ]));
        },
        separatorBuilder: (ctx, ind) {
          return Divider();
        },
        itemCount: food[0].toMap().length,
      )),
    );
  }
}
