import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/screens/home/home.dart';
import 'package:flutter_application_1/screens/login/login_page.dart';
import 'package:flutter_application_1/screens/signup/signup.dart';


class Wrapper extends StatefulWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {

      return LoginPage();

      

    }
  
}

