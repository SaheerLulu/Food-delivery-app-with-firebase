import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home/home.dart';
import 'package:flutter_application_1/screens/login/login_page.dart';



class Wrapper extends StatelessWidget {
  
  @override
  
  Widget build(BuildContext context) {
      
      return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapShot){
          if (snapShot.hasData){
            return HomePage();

          }else{
          return LoginPage();
          }
        }
        );
  }
      
 
  
}