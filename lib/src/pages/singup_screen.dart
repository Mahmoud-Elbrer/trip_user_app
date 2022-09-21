import 'package:flutter/material.dart';
import '../../config/routes/app_routes.dart';
import '../elements/custom_email_textfield.dart';

import '../elements/rounded_button.dart';
import '../elements/rounded_button_sign_with.dart';
import '../elements/rounded_password_textfield.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName  = Routes.signUpRoute ;
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Sign Up",
            style: TextStyle(
                color: Color(0xff000000),
                fontWeight: FontWeight.w500,
                fontFamily: "Poppins",
                fontStyle: FontStyle.normal,
                fontSize: 22.0),
            textAlign: TextAlign.left),
      ),
      body: Container(
        color: const Color(0xfff1f9ff),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              // Sign In
              const SizedBox(height: 40,) ,
              const Text(
                  "Sign In",
                  style:  TextStyle(
                      color:   Color(0xff000000),
                      fontWeight: FontWeight.w700,
                      fontFamily: "Montserrat",
                      fontStyle:  FontStyle.normal,
                      fontSize: 36.0
                  ),
                  textAlign: TextAlign.left
              ) ,
              const SizedBox(height: 20,) ,

              // email
              const Text(
                  "email",
                  style: TextStyle(
                      color:  Color(0xff000000),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Montserrat",
                      fontStyle:  FontStyle.normal,
                      fontSize: 12.0
                  ),
                  textAlign: TextAlign.left
              ),
              const SizedBox(height: 8,) ,
              const CustomEmailField(text: 'Email'),
              const SizedBox(height: 10,) ,
              const Text(
                  "Password",
                  style: TextStyle(
                      color:  Color(0xff000000),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Montserrat",
                      fontStyle:  FontStyle.normal,
                      fontSize: 12.0
                  ),
                  textAlign: TextAlign.left
              ),
              const SizedBox(height: 8,) ,
              const RoundedPasswordTextField(text: 'Email'),

              const RoundedButton(text: 'Sign Up'),


              Container(
                margin: const EdgeInsets.symmetric(vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                              style: TextStyle(
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Montserrat",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                              text: "Already have an account ? "),
                          TextSpan(
                              style: TextStyle(
                                  color: Color(0xffb2002d),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Montserrat",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                              text: "Sign Up")
                        ])),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
