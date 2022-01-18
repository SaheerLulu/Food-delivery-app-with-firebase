import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/food.dart';
import 'package:flutter_application_1/screens/admin/add_food.dart';
import 'package:flutter_application_1/screens/detail/detail.dart';
import 'package:flutter_application_1/screens/home/home.dart';
import 'package:flutter_application_1/screens/home/widget/food_list.dart';
import 'package:flutter_application_1/screens/home/widget/food_list_test.dart';
import 'package:flutter_application_1/screens/login/login_page.dart';
import 'package:flutter_application_1/services/adding_data_test.dart';
import 'package:flutter_application_1/services/reading_data.dart';



class Wrapper extends StatefulWidget {
  
  
  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  
  Widget build(BuildContext context) {
          return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapShot){
          if (snapShot.hasData){
            return HomePage();

          }else{
            print("in wrapper");
          // return LoginPage();
          // return ReadingData();
          return HomePage();
          // return DetailPage(food);
          // return AddFood();
          
          // return AddingData();
          }
        }
        );
  }
}