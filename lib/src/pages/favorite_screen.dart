import 'package:flutter/material.dart';

import '../elements/TripWidgets.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Trips')),
      body: Container(
        color: const Color(0xfff1f9ff),
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: const [
                TripWidgets(text: 'Dubai' ,  imagePath: 'assets/images/image.jpg',),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
