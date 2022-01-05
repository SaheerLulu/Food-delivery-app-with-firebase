import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login/login_page.dart';
import 'package:flutter_application_1/services/auth.dart';

class CustomAppBar extends StatelessWidget {
 final IconData leftIcon;
 final IconData rightIcon;
 final Function? leftCallback; 
 final AuthServie _auth = AuthServie();
 CustomAppBar(this.leftIcon,this.rightIcon,{this.leftCallback});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top ,
        left:25,
        right: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: leftCallback != null ? () => leftCallback!() : null,
            child:_buildIcon(leftIcon),
          ),
          GestureDetector(
            onTap: () async{
              await _auth.signOut();
              Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
              print("signour presesed");

            
              
              
            },
            child: _buildIcon(rightIcon),),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon) {
    return  Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(icon),
        
          );
  }
}