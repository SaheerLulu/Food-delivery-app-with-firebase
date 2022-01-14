import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/food.dart';

class AddFoodTest extends StatefulWidget {
  @override
  State<AddFoodTest> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFoodTest> {
  List<Food> food = Food.generateRecommendFoods(); 
  final _formKey = GlobalKey<FormState>();
  final foodDB = FirebaseFirestore.instance.collection("food");

  

  String values="";

  @override
  Widget build(BuildContext context) {
    var  Values = List<dynamic>.filled(food[0].toMap().length,0);
    return SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              Expanded(
                flex: 9,
                child: Container(
                child: Form(
                  key: _formKey,
                  child: ListView.separated(
                        itemBuilder: (ctx, ind) {
                  String key = food.elementAt(0).toMap().keys.elementAt(ind);
                  print(food[0].toMap().length);
                  return Padding(
                    padding: EdgeInsets.only(left:15,),
                    child: Container(
                        width: double.infinity,
                        child:
                            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(child: Text(key)),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  width: double.infinity / 2,
                                  child: TextFormField(
                                    onChanged: (value) {
                                    
                                      Values[ind]=value;
                                      
                                     
                                     
                                      
                                    },
                                    decoration: InputDecoration(
                                        hintText: key,
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                            ],
                                          )
                                        ])),
                  );
                        },
                        separatorBuilder: (ctx, ind) {
                  return Divider();
                        },
                        itemCount: food[0].toMap().length,
                      ),
                ),
            ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: ElevatedButton(onPressed: () {
                    print(Values);
                    Food foodData = Food.generateFood(Values);
                    foodDB.doc(foodData.name).set(foodData.toMap(),SetOptions(merge: true));


                    
                  },
                  child:Text("test"),

                ),
              )),]
          )),
    );
  }
}
