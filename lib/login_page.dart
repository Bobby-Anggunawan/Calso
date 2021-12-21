import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {

    TextEditingController phoneInput = TextEditingController();
    TextEditingController OTPInput = TextEditingController();

    FirebaseAuth auth = FirebaseAuth.instance;

    return Scaffold(
      body: Center(
          child: ListView(
              shrinkWrap: true,
              children: [
                TextFormField(
                    controller: phoneInput,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                    )
                ),
                ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: phoneInput.value.text,
                      verificationCompleted: (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},

                      codeSent: (String verificationId, int? resendToken) async {
                        showDialog(
                            context: context,
                            builder: (BuildContext context){
                              return AlertDialog(
                                  content: ListView(
                                      shrinkWrap: true,
                                      children: [
                                        TextFormField(
                                            controller: OTPInput,
                                            decoration: InputDecoration(
                                              labelText: 'OTP',
                                            )
                                        ),
                                        ElevatedButton(
                                          child: Text('Login'),
                                          onPressed: (){
                                            // Update the UI - wait for the user to enter the SMS code
                                            String smsCode = OTPInput.value.text;
                                            // Create a PhoneAuthCredential with the code
                                            PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
                                            // Sign the user in (or link) with the credential
                                            auth.signInWithCredential(credential).then((value) => Navigator.pushNamed(context, "/home",));
                                          },

                                        )
                                      ]
                                  )
                              );
                            }
                        );
                      },

                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                  },
                  child: Text('Verify'),
                )
              ]
          )
      )
    );
  }
}
