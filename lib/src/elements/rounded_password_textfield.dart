import 'package:flutter/material.dart';


class RoundedPasswordTextField extends StatelessWidget {
  final String? text;
  final VoidCallback? press;
  final Color color, textColor;
  final TextEditingController? controller;
  final bool obscureText;
  final focusOnFieldSubmitted;
  final focusNode;

  const RoundedPasswordTextField({
    Key? key,
    this.text,
    this.press,
    this.color = Colors.white,
    this.textColor = Colors.white,
    this.controller,
    this.obscureText = true,
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
            color:  Color(0xff1c2340),
            fontWeight: FontWeight.w400,
            // fontFamily: "Roboto",
            fontStyle: FontStyle.normal,
            fontSize: 16.0),
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: press ,
            child: obscureText
                ? const Icon(
                    Icons.visibility,
                    color: Colors.grey,
                  )
                : const Icon(
                    Icons.visibility_off,
                    color: Colors.grey,
                  ),
          ),
          border: InputBorder.none,
          filled: true,
          fillColor: const Color(0xfff3f3f3),
          hintText: text,
        ),
        //  ^((?=.*\d)(?=.*[a-zA-Z])[a-zA-Z0-9!@#$%&*]{6,20})$
        validator: (String? value) {
          if (value!.isEmpty) {
            return  'this_field_cannot_be_empty';
          } else if (value.length  < 4)  {
            return 'this_field_cannot_be_empty_password';
          } else {
            return null;
          }
        },
      ),
    );
  }
}


/*
  validator: (String value) {
          if (value.isEmpty) {
            return getTranslated(context, 'this_field_cannot_be_empty');
          } else if (!RegExp(
                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{4,}$')
              .hasMatch(value)) {
            failToast(context,
                getTranslated(context, 'this_field_cannot_be_empty_password'));
            return getTranslated(
                context, 'this_field_cannot_be_empty_password');
          } else {
            return null;
          }
        },
 */
