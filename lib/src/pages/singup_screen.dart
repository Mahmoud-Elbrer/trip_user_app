import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:trip_user_app/src/pages/bottom_navigation_screen.dart';
import 'package:trip_user_app/src/pages/login_screen.dart';
import '../../config/routes/app_routes.dart';
import '../controllers/authentication_provider.dart';
import '../elements/custom_email_textfield.dart';
import '../elements/rounded_button.dart';
import '../elements/rounded_button_sign_with.dart';
import '../elements/rounded_name_textfield.dart';
import '../elements/rounded_password_textfield.dart';
import '../models/signup_model.dart';
import '../utilitis/alert_dialog.dart';
import '../utilitis/seenAuth.dart';
import '../utilitis/toast.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = Routes.signUpRoute;

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

bool _obscurePasswordTextFiled = true;

class _SignUpScreenState extends State<SignUpScreen> {
  //bool _checkbox = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _nameController;
  TextEditingController? _emailController;
  TextEditingController? _passwordController;
  String? name, email, password;
  final _nameFocusNode = FocusNode();
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
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController!.dispose();
    _emailController!.dispose();
    _passwordController!.dispose();
    // TODO: implement dispose
    // dispose FocusNode
    _nameFocusNode.dispose();
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
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xfff1f9ff),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sign In
                  const SizedBox(
                    height: 40,
                  ),
                  const Text("Sign Up",
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
                  const Text("Name",
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
                  RoundedNameTextField(
                    text: 'Name',
                    controller: _nameController,
                    focusNode: _emailFocusNode,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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
                      focusOnFieldSubmitted: _emailFocusNode,
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
                  ),

                  RoundedButton(
                      text: 'Sign Up',
                      press: () async {
                        if (_formKey.currentState!.validate()) {
                          SignUpModel loginModel =
                              SignUpModel(name: _nameController!.text, email: _emailController!.text, password: _passwordController!.text);
                          var loginJsonModel = jsonEncode(loginModel);
                          // await EasyLoading.showSuccess('Great Success!');
                          //  await EasyLoading.dismiss();
                          // asyLoading.showError('Failed with Error');
                          await EasyLoading.show(
                            status: 'loading...',
                            maskType: EasyLoadingMaskType.black,
                          );
                          signUp(context, loginJsonModel);
                        } else {}
                      }),

                  GestureDetector(
                    onTap: () async {
                      Navigator.pushReplacementNamed(
                          context, LoginScreen.routeName);
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
                                text: "Sign In")
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

  Future<void> signUp(BuildContext context, var loginJsonModel) async {
    try {
      Map<String, dynamic>? response =
          await Provider.of<AuthenticationProvider>(context, listen: false)
              .signUp(loginJsonModel) ;

      print("new res");
      print(response);

      if (response!['success'] == true) {
        EasyLoading.showSuccess('Done');
        saveSeenAuth();
        Navigator.pushReplacementNamed(context, BottomNavigationScreen.routeName);
        // await _progressDialog.hide();
        //successToast(context, getTranslationLanguage(response['message'])!);
      //  Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      } else {
        // await _progressDialog.hide();
        EasyLoading.showError(response['message']);
        //showAlert(context, getTranslated(context, 'alert'), getTranslationLanguage(response['description']));
      }
    } on HttpException catch (error) {
      EasyLoading.showError('Failed with Error' + error.toString());
      error.toString();
      // await _progressDialog.hide();
     // showAlert(context, getTranslated(context, 'alert'), getTranslated(context, 'error_occurred'));
    } catch (error) {
      EasyLoading.showError('check_for_internet_connection');
      // await _progressDialog.hide();
      //showAlert(context, getTranslated(context, 'alert'), getTranslated(context, 'check_for_internet_connection'));
    }
  }
}
