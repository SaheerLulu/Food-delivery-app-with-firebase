import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/food.dart';

class AddingData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Food> food = Food.generateRecommendFoods();
    final foodDB = FirebaseFirestore.instance.collection("food");
    print("test");

    food.map((foods) => {
          foodDB.doc(foods.name).set(foods.toMap(),SetOptions(merge: true))
          
        }).toList();
    return Container();
  }
}
