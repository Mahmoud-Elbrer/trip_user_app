import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/routes/app_routes.dart';
import '../controllers/trip_program_provider.dart';
import '../elements/TourProgramsWidget.dart';
import '../utilitis/data_connaction_alert.dart';

class TourProgramsScreen extends StatefulWidget {
  static const String routeName = Routes.tourProgramsRoute;

  const TourProgramsScreen({Key? key}) : super(key: key);

  @override
  State<TourProgramsScreen> createState() => _TourProgramsScreenState();
}

class _TourProgramsScreenState extends State<TourProgramsScreen> {
  void _refreshPage() async {
    setState(() {
      buildFavoriteTrip(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          child: buildFavoriteTrip(context),
        ),
      ),
    );
  }

  Widget buildFavoriteTrip(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<TripProgramProvider>(context, listen: false)
          .fetchTripProgram(),
      builder: (context, AsyncSnapshot snapShot) {
        switch (snapShot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: loadingSpinKitWanderingCubes(context));
            break;
          case ConnectionState.active:
            return Center(child: loadingSpinKitWanderingCubes(context));
            break;
          case ConnectionState.none:
            //  todo  handle error
            return connectionError(context, _refreshPage);
            break;
          case ConnectionState.done:
            if (snapShot.hasError) {
              //  snapShot.error != null
              // todo  handle error data
              return connectionError(context, _refreshPage);
            } else {
              final productsData =
                  Provider.of<TripProgramProvider>(context).items;
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
                return GridView.builder(
                  itemCount: productsData.length,
                  itemBuilder: (context, index) {
                    return ChangeNotifierProvider.value(
                      value: productsData[index],
                      child:  TourProgramsWidget(),
                    );
                  },
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // 3
                    childAspectRatio: 2 / 3, //  : //2 / 2.5,
                    // mainAxisSpacing: 20,
                    // crossAxisSpacing: 20,

                  ),
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
