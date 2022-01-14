import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/models/food.dart';
import 'package:flutter_application_1/screens/admin/widget/food_image_picker.dart';
import 'package:flutter_application_1/screens/detail/widget/food_img.dart';


class AddFood extends StatefulWidget {
  @override
  _AddFoodState createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  final _formKey = GlobalKey<FormState>();

  String imgUrl = "";
  String desc = "";
  String name = "";
  var price; 
  String about = "";
  bool highLight = false;

  @override
  Widget build(BuildContext context) {
    final  foodsp =Food.generateRecommendFoods();
    Food foodn= foodsp[0];
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          loginPageColorTop,
          loginPageColorMid,
          loginPageColorBottom
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Add Food",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ],
              ),
            ),
            FoodImgPicker(foodn),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                 ),
                    child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left:30,right: 30),
                    child: Column(
                      children: <Widget>[
                        
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: _containerDecoration(),
                                  child: TextFormField(
                                    onChanged: (val) {},
                                    decoration: _textFormDecoration("Name"),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: _containerDecoration(),
                                  child: TextFormField(
                                    onChanged: (val) {},
                                    decoration:
                                        _textFormDecoration("Description"),
                                  ),
                                ),
                                
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: _containerDecoration(),
                                  child: TextFormField(
                                    onChanged: (val) {},
                                    decoration: _textFormDecoration("Price"),
                                  ),
                                ),
                                
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: _containerDecoration(),
                                  child: TextFormField(
                                    onChanged: (val) {},
                                    decoration: _textFormDecoration("About"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () async {},
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 100),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.orange[900]),
                            child: Center(
                              child: Text(
                                "Add",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  InputDecoration _textFormDecoration(hint) {
    return InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none);
  }

  BoxDecoration _containerDecoration() {
    return BoxDecoration(
        border: Border(
            bottom: BorderSide(
      color: Colors.grey,
    )));
  }
}
