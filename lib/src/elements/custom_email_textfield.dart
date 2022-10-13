import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomEmailField extends StatelessWidget {
  final String? text;
  final Function? press;
  final Color color, textColor;
  final TextEditingController? controller;
  final focusOnFieldSubmitted;
  final focusNode;
  final int? maxNumber;

  const CustomEmailField({
    Key? key,
    required this.text,
    this.press,
    this.color = Colors.white,
    this.controller,
    this.textColor = Colors.white,
    this.focusOnFieldSubmitted,
    this.focusNode,
    this.maxNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(focusOnFieldSubmitted);
        },
        focusNode: focusNode,
        //maxLength: 10,
        // inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
        controller: controller,
        autofocus: false,
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor: const Color(0xfff3f3f3),
          hintText: text,
        ),
        validator: (String? value) {
          if (value!.isEmpty ||
              !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                  .hasMatch(value)) {
            return 'invalid email';
          } else {
            return null;
          }
        },
      ),
    );
  }
}
