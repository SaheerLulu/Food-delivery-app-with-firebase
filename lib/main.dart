import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/screens/home/home.dart';
import 'package:flutter_application_1/screens/login/login_page.dart';
import 'package:flutter_application_1/screens/signup/signup.dart';
import 'package:flutter_application_1/screens/wrapper/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/services/auth.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      )
    );
    // adding stream provider for detecting any changes in the login
    return StreamProvider<UserModel?>.value(
        value: AuthServie().user, 
        initialData: UserModel("nouser"),
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food Delivery App', 
        // home: HomePage(),
        home: Wrapper())
    
    
    );
  }
}
