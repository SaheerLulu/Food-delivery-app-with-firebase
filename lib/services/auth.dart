import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/models/user.dart';

class AuthServie{
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  // Creating function to get uid by calling UserModel class
  UserModel? _userFromFirebaseUser (User user){
    return UserModel(user.uid);
  }

  // creating user stream
  Stream<UserModel?> get user{
    return _auth.authStateChanges()
    .map((User? user) => _userFromFirebaseUser(user!));
  }

  //sign in anonymousely
  Future signInAnon() async {
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      // print(result);
      return _userFromFirebaseUser(user!);
    }catch(e){
      print(e.toString());
      return "Some Error in sign in";
    }
  }
  

  //sign in with email & password

  //register with email & password

  //sign out
Future<void> signOut() async {
  try{
    return await _auth.signOut();

  }catch(e){
    print(e.toString());
    return null;
  }
}
}