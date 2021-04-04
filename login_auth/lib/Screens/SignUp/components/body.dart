import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_auth/Screens/SignUp/components/background.dart';
import 'package:login_auth/components/AlreadyHaveDoestHave.dart';
import 'package:login_auth/components/RoundedInputField.dart';
import 'package:login_auth/components/RoundedPassInputField.dart';
import 'package:login_auth/components/roundedButton.dart';

class Body extends StatelessWidget {
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
          SizedBox(height: size.height*0.03,),
          SvgPicture.asset(
            "asserts/icons/signup.svg",
            height: size.height * 0.38,
          ),
          SizedBox(height: size.height*0.03,),
          RoundedInputField(
            hintText: "Your Email",
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            hintText: "Password",
            onChanged: (value) {},
          ),
          RoundedButton(
            text: "Signup",
            press: () {},
          ),
          SizedBox(height: size.height*0.03,),
          AlreadyHaveAnAcc(
            login: false,
            press: () {},
          )
        ],
      ),
    );
  }
}