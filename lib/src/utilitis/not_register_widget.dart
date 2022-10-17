import 'package:flutter/material.dart';
import 'package:trip_user_app/src/pages/login_screen.dart';

class NotRegisterWidget extends StatelessWidget {
  const NotRegisterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Your Are Not Sign' ,style: TextStyle(color: Colors.black)),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
              child: Text('Sing In'))
        ],
      ),
    );
  }
}

// Register
