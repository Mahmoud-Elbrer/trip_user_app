import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../localization/language_constants.dart';




class CustomAgeTextField extends StatelessWidget {
  final String? text;
  final Function? press;
  final Color color, textColor;
  final TextEditingController? controller;
  final focusOnFieldSubmitted;
  final focusNode;
  final int? maxNumber;

  const CustomAgeTextField({
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
        keyboardType: TextInputType.phone,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(focusOnFieldSubmitted);
        },
        focusNode: focusNode,
        //maxLength: 10,
       // inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
        controller: controller,
        autofocus: false,
        style: const TextStyle(
            color: const Color(0xff1c2340),
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 16.0),
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor: const Color(0xfff3f3f3),
          hintText: text,
        ),
        validator: (String? value) {
          if (value!.isEmpty || !RegExp(r'(^(?:[+0]9)?[0-9]{2}$)').hasMatch(value)) {
            return getTranslated(context, 'invalid_number');
          } else {
            return null;
          }
        },
      ),
    );
  }
}
