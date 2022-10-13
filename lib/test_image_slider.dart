import 'package:flutter/material.dart';
import 'package:google_static_maps_controller/google_static_maps_controller.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            child: StaticMap(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              scaleToDevicePixelRatio: true,
              googleApiKey: "AIzaSyDQ2c_pOSOFYSjxGMwkFvCVWKjYOM9siow",
              visible: const [
                GeocodedLocation.address('Santa Monica Pier'),
              ],
              zoom: 14,
              markers: const <Marker>[
                Marker(
                  color: Colors.red,
                  locations: [
                    GeocodedLocation.latLng(34.012849, -118.501478),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
