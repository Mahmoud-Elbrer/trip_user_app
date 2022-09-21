import 'package:flutter/material.dart';
import '../../localization/language_constants.dart';

class RoundedTextField extends StatelessWidget {
  final String? text;
  final Function? press;
  final Color color, textColor;
  final TextEditingController? controller;
  final bool obscureText;
  final focusOnFieldSubmitted;
  final focusNode;

  const RoundedTextField({
    Key? key,
    this.text,
    this.press,
    this.color = Colors.white,
    this.textColor = Colors.white,
    this.controller,
    this.obscureText = false,
    this.focusOnFieldSubmitted,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
      child: TextFormField(
        controller: controller,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(focusOnFieldSubmitted);
        },
        focusNode: focusNode,
        obscureText: obscureText,
        autofocus: false,
        style: const TextStyle(
            color: const Color(0xff1c2340),
            fontWeight: FontWeight.w400,
            // fontFamily: "Roboto",
            fontStyle: FontStyle.normal,
            fontSize: 16.0),
        decoration: InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
//          suffixIcon: GestureDetector(
//            onTap: press,
//            child: Icon(
//              Icons.remove_red_eye,
//              color: Colors.grey,
//            ),
//          ),
      //  counterText:text ,
          border: InputBorder.none,
          filled: true,
          fillColor: const Color(0xfff3f3f3),

          hintText: text,
          labelText: text,
          labelStyle: TextStyle(fontSize: 14.0),

        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return getTranslated(context, 'this_field_cannot_be_empty');
          } else {
            return null;
          }
        },
      ),
    );
  }
}
