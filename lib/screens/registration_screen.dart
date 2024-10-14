import 'package:chatter_whydots/components/round_action_button.dart';
import 'package:chatter_whydots/constants.dart';
import 'package:chatter_whydots/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});
  static String id = '/registrationScreen';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late String confirmedPassword;
  bool showSpinner = false;
  bool registrationError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        blur: 0.5,
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: 'logo',
                child: SizedBox(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: getTextFieldInputDecoration('Enter your email'),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                onChanged: (value) {
                  password = value;
                },
                obscureText: true,
                decoration: getTextFieldInputDecoration('Enter your password'),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                onChanged: (value) {
                  confirmedPassword = value;
                },
                obscureText: true,
                decoration: getTextFieldInputDecoration('Confirm your password'),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                registrationError ? 'Either email or password is badly formatted' : " ",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              RoundActionButton(
                label: 'Register',
                onPressed: () async {
                  try {
                    setState(() {
                      showSpinner = true;
                    });
                    if(confirmedPassword == password) {
                      await _auth.createUserWithEmailAndPassword(email: email, password: password);
                      if(mounted) {
                        Navigator.pushNamed(context, LoginScreen.id);
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } else {
                      throw Exception();
                    }
                  } catch(exception) {
                    setState(() {
                      registrationError = true;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
