import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_auth/Screens/Login/LoginScreen.dart';
import 'package:login_auth/Screens/SignUp/SignUpScreen.dart';
import 'package:login_auth/Screens/Welcome/components/background.dart';
import 'package:login_auth/components/roundedButton.dart';
import 'package:login_auth/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome to Hackathon",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            SvgPicture.asset(
              "asserts/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            RoundedButton(
              text: "Login",
              press: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    }
                  )
                );
              },
            ),
            RoundedButton(
              text: "Sign UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    }
                  )
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
