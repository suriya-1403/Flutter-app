import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_auth/Screens/Login/LoginScreen.dart';
import 'package:login_auth/Screens/SignUp/components/background.dart';
import 'package:login_auth/components/AlreadyHaveDoestHave.dart';
import 'package:login_auth/components/RoundedInputField.dart';
import 'package:login_auth/components/RoundedPassInputField.dart';
import 'package:login_auth/components/roundedButton.dart';

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
            "Signup",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          SvgPicture.asset(
            "asserts/icons/signup.svg",
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
            text: "Signup",
            press: () {
              auth.createUserWithEmailAndPassword(
                  email: email, password: password);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LoginScreen();
              }));
            },
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          AlreadyHaveAnAcc(
            login: false,
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LoginScreen();
              }));
            },
          )
        ],
      ),
    );
  }
}
