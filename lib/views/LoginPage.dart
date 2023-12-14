import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:interview/Controller.dart';
import 'package:interview/views/OtpPage.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Login Page'),
      ),
      body: ListView(children: [
        Container(
          margin: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          child: TextField(
            onChanged: (value) {
              number = value;
            },
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: "Ex:+918008513742"),
            keyboardType: TextInputType.phone,
          ),
        ),
        const SizedBox(
          height: 50.0,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: ElevatedButton(
            onPressed: () async {
              if (number.length >= 13) {
                await SigninPhone(number, ref, context);
              } else {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        title: Text("Please Enter a valid number"),
                        content: Text('Ex:- +918008513742'),
                      );
                    });
              }
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Text('Login ->'),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
          child: ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.deepPurple)),
            onPressed: () async {
              await signInWithGoogle();
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Text('Sign In with Google'),
            ),
          ),
        ),
      ]),
    );
  }

  Future<void> SigninPhone(
      String number, WidgetRef ref, BuildContext context) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        forceResendingToken: 10,
        phoneNumber: number,
        verificationCompleted: (PhoneAuthCredential credential) async {
          print("Login Completed");
        },
        verificationFailed: (FirebaseAuthException e) {
          print("Login Failed");
        },
        codeSent: (String verificationId, int? resendToken) {
          print("Code sent");
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return OtpScreen(
              verificationid: verificationId,
            );
          }));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print("code time out");
        },
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) {});
      }
    } catch (e) {
      print(e);
    }
  }
}
