import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../localization/language_constants.dart';
//import 'package:super_tooltip/super_tooltip.dart';

class CustomPhoneNumberTextField extends StatelessWidget {
  final String? text;
  final Color color, textColor;
  final TextEditingController? controller;
  final focusOnFieldSubmitted;
  final focusNode;

  const CustomPhoneNumberTextField({
    Key? key,
    required this.text,
    this.color = Colors.white,
    this.controller,
    this.textColor = Colors.white,
    this.focusOnFieldSubmitted,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // SuperTooltip tooltip;
    return Theme(
      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
      child: TextFormField(
        //  maxLength: 10,
        controller: controller,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(focusOnFieldSubmitted);
        },
        focusNode: focusNode,
        keyboardType: TextInputType.phone,
        //maxLength: 10,
        //inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
        autofocus: false,
        style: const TextStyle(
            color: const Color(0xff1c2340),
            fontWeight: FontWeight.w400,
            // fontFamily: "Roboto",
            fontStyle: FontStyle.normal,
            fontSize: 16.0),
        decoration: InputDecoration(
//          suffixIcon: IconButton(
//            icon: Icon(Icons.error, color: Colors.black26),
//            onPressed: () {
//              tooltip = SuperTooltip(
//                popupDirection: TooltipDirection.up,
//                arrowTipDistance: 40,
//                content: new Material(
//                    child: Text(
//                  getTranslated(context, 'this_field_cannot_be_empty_phone') +
//                      ' - ' +
//                      getTranslated(context, 'phone_number_correct_content'),
//                  softWrap: true,
//                )),
//              );
//
//              tooltip.show(context);
//            },
//          ),
          border: InputBorder.none,
          filled: true,
          fillColor: const Color(0xfff3f3f3),
          hintText: text,
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return getTranslated(context, 'this_field_cannot_be_empty_phone');
          } else if (!RegExp(r'(^(?:[+0]9)?[0-9]{10}$)').hasMatch(value)) {
            return getTranslated(context, 'phone_number_correct_content');
          } else {
            return null;
          }
        },
      ),
    );
  }
}
