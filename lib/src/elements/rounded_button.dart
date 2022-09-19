import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String? text;
  final Function? press;
  final Color color, textColor , backgroundColor;

  const RoundedButton({
    Key? key,
    this.text,
    this.press,
    this.color = Colors.white,
    this.textColor = Colors.white,
    this.backgroundColor = const Color(0xff0081df),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top :  19),
      child: InkWell(
        onTap: press as void Function()?,
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            width: size.width * .8,
           // height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color:   this.backgroundColor ),
            child: Center(
              child: // sign in
              Text(
                text!,
                style: const TextStyle(
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                    // fontFamily: "Roboto",
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
