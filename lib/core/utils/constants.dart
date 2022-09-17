import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trip_user_app/core/utils/app_colors.dart';
import 'package:trip_user_app/core/utils/app_strings.dart';

class Constants {
  static void showErrorDialog(
      {required BuildContext context, required String msg}) {
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(msg,
                  style: const TextStyle(fontSize: 16, color: Colors.black)),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                        primary: Colors.black,
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        )),
                    child: const Text(AppStrings.ok))
              ],
            ));
  }

  static void showToast(
      {required String msg, Color? color, ToastGravity? toastGravity}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: color ?? AppColors.primary,
      gravity: toastGravity ?? ToastGravity.BOTTOM,
    );
  }
}
