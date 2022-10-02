import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoundedNameTextField extends StatelessWidget {
  final String? text;
  final Function? press;
  final Color color, textColor;
  final TextEditingController? controller;
  final bool obscureText;
  final focusOnFieldSubmitted;
  final focusNode;

  const RoundedNameTextField({
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
            color:   Color(0x8a4e6772),
            fontWeight: FontWeight.w500,
            fontFamily: "Poppins",
            fontStyle:  FontStyle.normal,
            fontSize: 15.0),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          border: InputBorder.none,
          filled: true,
          fillColor: const Color(0xfff3f3f3),
          hintText: text,
          labelText: text,
          labelStyle: const TextStyle(
              color: Color(0x8a4e6772),
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
              fontStyle: FontStyle.normal,
              fontSize: 15.0),
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'this_field_cannot_be_empty';
          } else {
            return null;
          }
        },
      ),
    );
  }
}
