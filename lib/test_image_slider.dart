import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


class MyAppFirebase extends StatefulWidget {
  const MyAppFirebase({Key? key}) : super(key: key);

  @override
  State<MyAppFirebase> createState() => _MyAppFirebaseState();
}

class _MyAppFirebaseState extends State<MyAppFirebase> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    FirebaseMessaging.onMessage.listen(
          (RemoteMessage message) {
        debugPrint("onMessage:");
        log("onMessage: $message");
        final snackBar =
        SnackBar(content: Text(message.notification?.title ?? ""));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(

        ),
       );
  }
}