import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_auth/Screens/Home/HomeScreen.dart';
import 'package:login_auth/Screens/Login/components/background.dart';
import 'package:login_auth/Screens/SignUp/SignUpScreen.dart';
import 'package:login_auth/Screens/Welcome/components/body.dart';
import 'package:login_auth/components/AlreadyHaveDoestHave.dart';
import 'package:login_auth/components/RoundedInputField.dart';
import 'package:login_auth/components/RoundedPassInputField.dart';
import 'package:login_auth/components/TextFieldContainer.dart';
import 'package:login_auth/components/roundedButton.dart';
import 'package:login_auth/constants.dart';

class Body extends StatelessWidget {
  String email = '', password = '';
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Login",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          SvgPicture.asset(
            "asserts/icons/login.svg",
            height: size.height * 0.38,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          RoundedInputField(
            hintText: "Your Email",
            onChanged: (value) {
              email = value.trim();
            },
          ),
          RoundedPasswordField(
            hintText: "Password",
            onChanged: (value) {
              password = value.trim();
            },
          ),
          RoundedButton(
            text: "Login",
            press: () {
              auth.signInWithEmailAndPassword(email: email, password: password);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomeScreen();
              }));
            },
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          AlreadyHaveAnAcc(
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SignUpScreen();
              }));
            },
          )
        ],
      ),
    );
  }
}
