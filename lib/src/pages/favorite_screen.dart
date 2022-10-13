import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/favorite_provider.dart';
import '../elements/TripWidgets.dart';
import '../utilitis/data_connaction_alert.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  void _refreshPage() async {
    setState(() {
      buildFavoriteTrip(context);
    });
    //    await Provider.of<ProviderGetMedicalSpecialty>(context , listen: false).fetchMedicalSpecialty();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Trips')),
      body: Container(
        color: const Color(0xfff1f9ff),
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: buildFavoriteTrip(context),
          ),
        ),
      ),
    );
  }

  Widget buildFavoriteTrip(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<ProviderFavorite>(context, listen: false)
          .fetchFavoriteTrip(),
      builder: (context, AsyncSnapshot snapShot) {
        switch (snapShot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: loadingSpinKitWanderingCubes(context));
            break;
          case ConnectionState.active:
            return Center(child: loadingSpinKitWanderingCubes(context));
            break;
          case ConnectionState.none:
            //  todo  handel error
            return connectionError(context, _refreshPage);
            break;
          case ConnectionState.done:
            if (snapShot.hasError) {
              //  snapShot.error != null
              // todo  handel error data
              return connectionError(context, _refreshPage);
            } else {
              final productsData = Provider.of<ProviderFavorite>(context).items;
              ////print("length");
              ////print(productsData);
              ////print(productsData.length);
              if (productsData.length == 0) {
                ////print("I am in NO dATA");
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child: notFoundWidget(context, 'no_data')),
                  ],
                );
              } else {
                ////print("I am in FavoriteGrid");
                return const TripWidgets(
                  text: 'Dubai',
                  imagePath: 'assets/images/image.jpg',
                );
              }
            }
            break;
          default:
            return connectionError(context, _refreshPage);
        }
      },
    );
  }
}
