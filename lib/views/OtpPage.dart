import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:interview/views/HomePage.dart';

class OtpScreen extends ConsumerWidget {
  OtpScreen({super.key, required this.verificationid});
  String verificationid;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        child: Center(
          child: OtpTextField(
            numberOfFields: 6,
            borderColor: const Color(0xFF512DA8),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode) async {
              print("running on submit");
              var res = PhoneAuthProvider.credential(
                  verificationId: verificationid, smsCode: verificationCode);
              bool status = false;
              await FirebaseAuth.instance
                  .signInWithCredential(res)
                  .then((value) {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MainPage();
                }));
              });
              Navigator.pop(context);
            }, // end onSubmit
          ),
        ),
      ),
    );
  }
}

void DialogFunc(BuildContext context, String verificationCode, bool mode) {
  if (mode) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Verification Code is Success"),
            content: Text('Code entered is $verificationCode'),
          );
        });
  } else {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Verification Code is Failed"),
            content: Text('Code entered is $verificationCode'),
          );
        });
  }
}
