import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  final _firebase = FirebaseAuth.instance;

  //final _google = new GoogleSignIn();

  /*
  Future<bool> signWithGoogle() async {
    final authenticated = _google.currentUser;
    _firebase.signInWithGoogle();
  }  */

  Future<bool> signWithPhone(String verifyId, String codigoSms) async {
    final loginResult = PhoneAuthProvider.getCredential(
        verificationId: verifyId, smsCode: codigoSms);
    if (loginResult != null) {
      return true;
    } else {
      return false;
    }
  }

  Future verifyPhoneNumber(String numberCelphone) async {
    await _firebase.verifyPhoneNumber(
        phoneNumber: numberCelphone,
        codeSent: (String verified, [int forceResend]) {
          print("verificado com sucesso");
          print(verified);
        },
        verificationFailed: (AuthException authenticaoException) {
          print("ocorreu um erro");
        },
        codeAutoRetrievalTimeout: (String timeOut) {
          print(timeOut);
        },
        timeout: Duration(seconds: 30),
        verificationCompleted: (AuthCredential phoneAuthCredential) {
          print(phoneAuthCredential);
        });
  }
}
