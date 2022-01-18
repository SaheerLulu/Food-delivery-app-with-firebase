import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter_application_1/models/food.dart';
import 'package:image_picker/image_picker.dart';

typedef void image_callback(File image_file);

class FoodImgPicker extends StatefulWidget {
  
 final image_callback image_changed;

 const FoodImgPicker({ Key? key ,required this.image_changed}) : super(key: key);
 

  @override
  State<FoodImgPicker> createState() => _FoodImgPickerState();
}

class _FoodImgPickerState extends State<FoodImgPicker> {
  ImagePicker picker = ImagePicker();
  

  ImageProvider _image = AssetImage("assets/images/dish1.png");

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      color: Colors.white),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onDoubleTap: () async {
                print("tapped");
                XFile? image = await picker.pickImage(
                    source: ImageSource.gallery, imageQuality: 10);

                setState(() {
                  if (image == null) {
                    _image = AssetImage("assets/images/dish1.png");
                   
                  } else {
                    _image = FileImage(File(image.path));
                    this.widget.image_changed(File(image.path));
                    print(image.path);
                  }
                });
              },
              child: Container(
                width: 200,
                height: 200,
                child: CircleAvatar(
                  backgroundImage: _image,
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
