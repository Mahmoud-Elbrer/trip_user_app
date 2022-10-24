import 'package:flutter/material.dart';
import 'package:trip_user_app/src/elements/GroupWidgets.dart';
import '../../config/routes/app_routes.dart';
import '../controllers/group_provider.dart';
import '../controllers/group_provider.dart';
import '../controllers/trip_provider.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GroupScreen extends StatefulWidget {
  final String emirateId;

  static const routeName = Routes.groupRoute;

  const GroupScreen({Key? key, required this.emirateId}) : super(key: key);

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  static const int take = 10;

  final RefreshController _refreshControllerDoctor = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    getTrips(emirateId : widget.emirateId);
  }

  bool isLoadingData = false;
  bool isErrorInternetConnection = false;

  void getTrips({required String emirateId}) async {
    try {
      setState(() {
        isLoadingData = true;
      });
      await Provider.of<GroupProvider>(context, listen: false).fetchGroup(
          take: take,
          skip: Provider.of<GroupProvider>(context, listen: false).items.length);
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
      // Provider.of<GroupProvider>(context, listen: false).clearData();
      Provider.of<GroupProvider>(context, listen: false)
          .fetchGroup(take: take, skip: 0);

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
    Provider.of<GroupProvider>(context, listen: false).fetchGroup(
        take: take,
        skip: Provider.of<GroupProvider>(context, listen: false).items.length);
    // await Future.delayed(Duration(milliseconds: 1000));
    _refreshControllerDoctor.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    final groupProvider = Provider.of<GroupProvider>(context, listen: true).items;
    return Scaffold(
      appBar: AppBar(title: Text('Event')),
      body: Container(
        color: const Color(0xfff1f9ff),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
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
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : isErrorInternetConnection
                      ? const Center(child: Text('Error'))
                      : groupProvider.isEmpty
                          ? const Center(child: Text('No Data'))
                          : ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, position) {
                                return ChangeNotifierProvider.value(
                                  value: groupProvider[position],
                                  child: const GroupWidget(),
                                );
                              },
                              itemCount: groupProvider.length,
                            ),
            ),
          ),
        ),
      ),
    );
  }
}
