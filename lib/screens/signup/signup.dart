

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/screens/login/login_page.dart';
import 'package:flutter_application_1/services/auth.dart';

class SignUp extends StatefulWidget {
  

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final AuthServie  _auth = AuthServie();
  String email="";
  String password = "";
  var phoneNumber = "";
  String name = "";



  @override
  Widget build(BuildContext context) {
    _auth.initializeFirebase();
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              loginPageColorTop,
              loginPageColorMid,
              loginPageColorBottom              
            ]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 40),),
               
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 30,),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(
                              color: Colors.grey.shade100,
                              blurRadius: 20,
                              offset: Offset(0, 10)
                            )]
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey))
                                  ),
                                  child: TextFormField(
                                    onChanged: (val){
                                      setState(()=> phoneNumber =val);
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Phone number",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey))
                                  ),
                                  child: TextFormField(
                                    onChanged: (val){
                                      setState(()=> name =val);
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Name",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey))
                                  ),
                                  child: TextFormField(
                                    onChanged: (val){
                                      setState(()=> email =val);
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Email",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey))
                                  ),
                                  child: TextFormField(
                                    onChanged: (val){
                                      setState(()=> password =val);
                                    },
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                    ),
                                  ),
                                ),
                                ],
                            ),
                          ),
                        ),
                        SizedBox(height: 40,),
                        
                        GestureDetector(
                        onTap: () async{
                          
                          // Navigator.of(context).pushReplacement(
                          // MaterialPageRoute(
                          //   builder: (context) => LoginPage(),
                          // ),
                          // );
                          // print(name);
                          // print(phoneNumber);
                          // print(email);
                          // print(password);
                          // dynamic user = await _auth.registerUsingEmailPassword(
                          //   email:email, 
                          //   name:name,
                          //   password:password,
                          //   phoneNumber: phoneNumber );
                          // print(user);
                          dynamic user = await _auth.registerWithPhone();
                          print("phone");
                          print(user);

            
              
              
                            },
                         
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.orange[900]
                            ),
                            child: Center(
                              
                              child: Text(
                                "Create Account", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        GestureDetector(
                          onTap: (){
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                          child: Container(
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                Text("Already a member?", style: TextStyle(color: Colors.black, ),),
                                Text("Sign in", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                                ],
                              )
                              ),
                        ),
                        SizedBox(height: 30,),

                        
                        Text("Sign up with social media", style: TextStyle(color: Colors.grey),),
                        SizedBox(height: 30,),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.blue
                                ),
                                child: Center(
                                  child: Text("Facebook", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ),
                            SizedBox(width: 30,),
                            Expanded(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.red
                                ),
                                child: Center(
                                  child: Text("Google", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),

                                ),
                              ),
                            )
                          ],
                        )
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
}

