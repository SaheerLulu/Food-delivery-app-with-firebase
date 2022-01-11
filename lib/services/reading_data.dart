import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReadingData {
    Future _readDB() async {
      final foodDB = await FirebaseFirestore.instance.collection("food");
      await foodDB.get().then((result) {
        result.docs.forEach((element) {
          print(element.data());
        });
      });
    }

    static Future<List<String>> getAllDocs() async {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("food").get();
      return (querySnapshot.docs.map((e) => e.reference.id).toList());
    }
    // _readDB();
  
  }

