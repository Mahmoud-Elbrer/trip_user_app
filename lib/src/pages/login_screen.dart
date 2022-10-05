import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:trip_user_app/src/pages/bottom_navigation_screen.dart';
import 'package:trip_user_app/src/pages/home_screen.dart';
import 'package:trip_user_app/src/pages/singup_screen.dart';
import 'package:trip_user_app/src/utilitis/toast.dart';
import '../../config/routes/app_routes.dart';
import '../../localization/language_constants.dart';
import '../controllers/authentication_provider.dart';
import '../elements/custom_email_textfield.dart';

import '../elements/rounded_button.dart';
import '../elements/rounded_button_sign_with.dart';
import '../elements/rounded_password_textfield.dart';
import '../models/login_model.dart';
import '../utilitis/alert_dialog.dart';
import '../utilitis/get_trans_language.dart';
import '../utilitis/seenAuth.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = Routes.loginRoute;

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool _obscurePasswordTextFiled = true;

class _LoginScreenState extends State<LoginScreen> {
  //bool _checkbox = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _emailController;
  TextEditingController? _passwordController;
  String? password, email;
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  // Toggles the password show status
  void _togglePasswordTextFiled() {
    setState(() {
      _obscurePasswordTextFiled = !_obscurePasswordTextFiled;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController!.dispose();
    _passwordController!.dispose();
    // TODO: implement dispose
    // dispose FocusNode
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

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
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text("Sign In",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w700,
                          fontFamily: "Montserrat",
                          fontStyle: FontStyle.normal,
                          fontSize: 36.0),
                      textAlign: TextAlign.left),
                  const SizedBox(
                    height: 20,
                  ),
                  // email
                  const Text("email",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w500,
                          fontFamily: "Montserrat",
                          fontStyle: FontStyle.normal,
                          fontSize: 12.0),
                      textAlign: TextAlign.left),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomEmailField(
                      text: 'Email',
                      controller: _emailController,
                      focusNode: _passwordFocusNode),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Password",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w500,
                          fontFamily: "Montserrat",
                          fontStyle: FontStyle.normal,
                          fontSize: 12.0),
                      textAlign: TextAlign.left),
                  const SizedBox(
                    height: 8,
                  ),
                  RoundedPasswordTextField(
                    text: 'Password',
                    controller: _passwordController,
                    focusOnFieldSubmitted: _passwordFocusNode,
                  ),

                  RoundedButton(
                      text: 'Sign Up',
                      press: () async {
                        if (_formKey.currentState!.validate()) {
                          email =  _emailController!.text ;
                          password =  _passwordController!.text ;
                          LoginModel loginModel =
                              LoginModel(email: email, password: password);
                          var loginJsonModel = jsonEncode(loginModel);
                          // await EasyLoading.showSuccess('Great Success!');
                          //  await EasyLoading.dismiss();
                          // asyLoading.showError('Failed with Error');
                          await EasyLoading.show(
                            status: 'loading...',
                            maskType: EasyLoadingMaskType.black,
                          );
                          login(context, loginJsonModel);

                        } else {}
                      }),

                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Or Sign By :",
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Montserrat",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.left),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const RoundedButtonSignWith(
                      text: 'Sign up with Apple',
                      backgroundColor: Color(0xff000000),
                      textColor: Color(0xffffffff),
                      iconPath: 'apple.svg'),
                  const RoundedButtonSignWith(
                      text: 'Sign up with Facebook',
                      backgroundColor: Color(0xff3a5998),
                      textColor: Color(0xffffffff),
                      iconPath: 'facebook.svg'),
                  const RoundedButtonSignWith(
                      text: 'Sign up with gmail',
                      backgroundColor: Color(0xfff6f2e9),
                      textColor: Color(0xff000000),
                      iconPath: 'email.svg'),

                  // Already have an account? Log In
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpScreen.routeName);
                    },
                    child: Container(
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login(BuildContext context, var loginJsonModel) async {
    try {
      Map<String, dynamic>? response =
          await Provider.of<AuthenticationProvider>(context, listen: false).login(loginJsonModel);


      print("after res ");
      print(response!);

      if (response['success']! == true) {
        // await _progressDialog.hide();
        EasyLoading.showSuccess('Done');
       // showAlert(context, getTranslated(context, 'alert'), getTranslationLanguage(response['message']));
        //successToast(context, getTranslationLanguage(response['message'])!);
        //saveSeenAuth();
        Navigator.pushReplacementNamed(context, BottomNavigationScreen.routeName);
      } else {
        // await _progressDialog.hide();
        EasyLoading.showError(response['message']);
       // showAlert(context, getTranslated(context, 'alert'), getTranslationLanguage(response['message']));
      }
    } on HttpException catch (error) {
      EasyLoading.showError('Failed with Error');
      error.toString();
      // await _progressDialog.hide();
      // showAlert(context, getTranslated(context, 'alert'), getTranslated(context, 'error_occurred'));
    } catch (error) {
      print('this it my error');
      print(error);
      EasyLoading.showError('Failed with Error');
      //EasyLoading.showError('check_for_internet_connection');
      // await _progressDialog.hide();
    //  showAlert(context, getTranslated(context, 'alert'), getTranslated(context, 'check_for_internet_connection'));
    }
  }
}
