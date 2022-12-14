import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../controllers/trip_provider.dart';
import '../elements/TripWidgets.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TestTripScreen extends StatefulWidget {
  static const routeName = 'notification-screen';

  const TestTripScreen({Key? key}) : super(key: key);

  @override
  _TestTripScreenState createState() => _TestTripScreenState();
}


class _TestTripScreenState extends State<TestTripScreen>
    with AutomaticKeepAliveClientMixin {
  static const int take = 10;

  RefreshController _refreshControllerDoctor = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    getNotificationData();
  }

  bool isLoadingData = false;
  bool isErrorInternetConnection = false;

  void getNotificationData() async {
    try {
      setState(() {
        isLoadingData = true;
      });
      await Provider.of<TripProvider>(context, listen: false)
          .fetchTrip(
          take: take,
          skip: Provider.of<TripProvider>(context, listen: false)
              .items
              .length);
    } catch (e) {
      setState(() {
        isErrorInternetConnection = true;
      });
      //print('it error concation ');
      //print(e);
    }
    setState(() {
      isLoadingData = false;
    });
  }

  void _onRefreshDoctorData() async {
    try {
      //print("_onRefresh");
      setState(() {
        isErrorInternetConnection = false;
        isLoadingData = true;
      });
      await Future.delayed(const Duration(milliseconds: 1000));
      // Provider.of<TripProvider>(context, listen: false).clearData();
      Provider.of<TripProvider>(context, listen: false)
          .fetchTrip(take: take, skip: 0);

      setState(() {
        isLoadingData = false;
      });
    } catch (e) {
      //print(e);
    }

    setState(() {});
    _refreshControllerDoctor.refreshCompleted();
  }

  void _onLoadingDoctorData() async {
    //print("_onLoading");
    Provider.of<TripProvider>(context, listen: false).fetchTrip(
        take: take,
        skip: Provider.of<TripProvider>(context, listen: false)
            .items
            .length);
    // await Future.delayed(Duration(milliseconds: 1000));
    _refreshControllerDoctor.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    final tripProvider =
        Provider.of<TripProvider>(context, listen: true).items;
    return Scaffold(
      appBar: AppBar(),

      body: Center(
        child: SmartRefresher(
          physics: const BouncingScrollPhysics(),
          enableTwoLevel: false,
          enablePullDown: true,
          enablePullUp: true,
          controller: _refreshControllerDoctor,
          onRefresh: _onRefreshDoctorData,
          onLoading: _onLoadingDoctorData,
          // scrollDirection: Axis.horizontal,
          // PageScrollPhysics  -  PageScrollPhysics() - ScrollPhysics -  NeverScrollableScrollPhysics
          // physics:BouncingScrollPhysics() ,
          header: const WaterDropHeader(),
         // footer: classicFooterWidget(context),
          child: isLoadingData
              ? Center(
            child: loading(),
          )
              : isErrorInternetConnection
              ? const Center(
              child: Text('Error'))
              : tripProvider.isEmpty
              ? const Center(
              child: Text('No Data'))
              : ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, position) {
              return ChangeNotifierProvider.value(
                value: tripProvider[position],
                child: const TripWidgets(),
              );
            },
            itemCount: tripProvider.length,
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

Widget loading(){
  return const CircularProgressIndicator();
}
