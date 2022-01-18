import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_application_1/models/food.dart';

class AddDataFirebase {
  final String collectionName;
  AddDataFirebase(this.collectionName);

  Future<void> add_data(Food food) async {
    final foodDB = FirebaseFirestore.instance.collection(collectionName);
    final imageDB = FirebaseStorage.instance.ref("images");
    foodDB.doc(food.name).set(food.toMap(), SetOptions(merge: true));
    imageDB.child(food.name!).putFile(food.imgFile!);
  }
}
