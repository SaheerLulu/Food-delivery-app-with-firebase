import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthServie {
  Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  String name = "";
  String email = "";
  String password = "";

  // //sign in anonymousely
  // Future signInAnon() async {
  //   try{
  //     UserCredential result = await _auth.signInAnonymously();
  //     User? user = result.user;
  //     return user;
  //   }catch(e){
  //     print(e.toString());
  //     return "Some Error in sign in";
  //   }
  // }

  //register in with email & password
  Future<User?> registerWithPhone() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    print("came here");
    auth.verifyPhoneNumber(
        phoneNumber: "+919895085582",
        verificationCompleted: (PhoneAuthCredential credential) async {
          print('${credential.smsCode}');
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.toString());
        },
        codeSent: (String verificationId, int? resendToken) async {
          String smsCode = "123456";
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: verificationId, smsCode: smsCode);
          await auth.signInWithCredential(credential);
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  Future<User?> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
    required var phoneNumber,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      await user!.updateDisplayName(name);
      // await user.updatePhoneNumber(phoneNumber);
      await user.sendEmailVerification();

      await user.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }

  //signin with email & password
  Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }

    return user;
  }

  //sign out
// Future<void> signOut() async {
//   try{
//     return await _auth.signOut();

//   }catch(e){
//     print(e.toString());
//     return null;
//   }
// }
// }
}
