import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:git/screens/home.dart';

class SendCode {
  static final _firebaseInit = Firebase.initializeApp();
  static FirebaseAuth _authUser = FirebaseAuth.instance;

  static TextEditingController phoneController = TextEditingController();
  static TextEditingController smsController = TextEditingController();
  static Future sendSms(context) async {
    _authUser.verifyPhoneNumber(
      phoneNumber: phoneController.text,
      verificationCompleted: (v) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Verification is completed !!!"),
          ),
        );
      },
      verificationFailed: (v) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Verifiction Faild !!!"),
          ),
         
        );
        print("$v");
      },
      codeSent: (verificationId, resentToken) async {
        PhoneAuthCredential _phoneCredential = PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: smsController.text,
        );

        await _authUser.signInWithCredential(_phoneCredential).then((value) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        });
      },
      codeAutoRetrievalTimeout: (v) {},
    );
  }
}
