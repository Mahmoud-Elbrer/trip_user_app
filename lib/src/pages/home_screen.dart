import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trip_user_app/src/models/trip_model.dart';
import 'package:trip_user_app/src/models/trip_program_model.dart';
import 'package:trip_user_app/src/pages/detail_trip_screen.dart';
import 'package:trip_user_app/src/pages/group_screen.dart';
import 'package:trip_user_app/src/pages/tour_programs.dart';
import 'package:trip_user_app/src/pages/trips_screen.dart';
import '../../config/routes/app_routes.dart';
import '../controllers/trip_program_provider.dart';
import '../elements/trip_program_widget.dart';
import '../utilitis/DrawerWidget.dart';
import '../utilitis/URL.dart';
import 'emirates_trip_screen.dart';
import '../elements/trip_home_widget.dart';
import '../utilitis/assets_manger.dart';
import '../controllers/trip_provider.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = Routes.homeRoute;

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const int take = 10;

  final RefreshController _refreshControllerDoctor =
      RefreshController(initialRefresh: false);
  final RefreshController _refreshControllerDoctor2 =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    getTrips();
    getTripsProgram();
  }

  bool isLoadingData = false;
  bool isErrorInternetConnection = false;

  void getTrips() async {
    try {
      setState(() {
        isLoadingData = true;
      });
      await Provider.of<TripProvider>(context, listen: false).fetchTrip(
          take: take,
          skip: Provider.of<TripProvider>(context, listen: false).items.length);
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

  void getTripsProgram() async {
    try {
      setState(() {
        isLoadingData = true;
      });
      await Provider.of<TripProgramProvider>(context, listen: false)
          .fetchTripProgram(
              take: take,
              skip: Provider.of<TripProgramProvider>(context, listen: false)
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
        skip: Provider.of<TripProvider>(context, listen: false).items.length);
    // await Future.delayed(Duration(milliseconds: 1000));
    _refreshControllerDoctor.loadComplete();
  }

  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final tripProvider = Provider.of<TripProvider>(context, listen: true).items;
    final tripProgramProvider =
        Provider.of<TripProgramProvider>(context, listen: true).items;
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   leading: const Icon(Icons.search , color: Colors.black,) ,
      //   title: const Text("Rihla",
      //       style: TextStyle(
      //           color: Color(0xff02376d),
      //           fontWeight: FontWeight.w400,
      //           //fontFamily: "AdobeDevanagari",
      //           fontStyle: FontStyle.normal,
      //           fontSize: 26.0),
      //       textAlign: TextAlign.left),
      // ),
      body: Container(
          color: const Color(0xfff1f9ff),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Rectangle 1

                  //  const RoundedTextField(text: 'Search trip'),
                  // RoundedTextField(text: translation(context).homePage),

                  const SizedBox(
                    height: 10,
                  ),

                  imageSlider(tripProvider),

                  rowTextShowAll(text: 'Event', index: 3),

                  Row(
                    children: [
                      eventProgram(
                          imageUrl: 'assets/icons/horse.svg',
                          color: const Color(0x738a6f64),
                          title: "Horse"),
                      eventProgram(
                          imageUrl: 'assets/icons/football.svg',
                          color: const Color(0xc78ad078),
                          title: "FootBall"),
                      eventProgram(
                          imageUrl: 'assets/icons/calender.svg',
                          color: const Color(0xffe7e7e7),
                          title: "FootBall"),
                    ],
                  ),

                  rowTextShowAll(text: 'Programs', index: 1),

                  tripProgram(tripProgramProvider),

                  // Column(
                  //   children: [
                  //     rowContainer(
                  //         text: 'Types of tourism',
                  //         imagePath: 'plane_fly.svg',
                  //         suffixIcon: 'down_arrow-com.svg'),
                  //     rowContainer(
                  //         text: 'Tour Programs',
                  //         imagePath: 'trip.svg',
                  //         suffixIcon: 'down_arrow-com.svg'),
                  //   ],
                  // ),

                  rowTextShowAll(text: 'Trips', index: 2),

                  SizedBox(
                    height: 411,
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
                              : tripProvider.isEmpty
                                  ? const Center(child: Text('No Data'))
                                  : ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, position) {
                                        return ChangeNotifierProvider.value(
                                          value: tripProvider[position],
                                          child: TripHomeWidget(),
                                        );
                                      },
                                      itemCount: tripProvider.length,
                                    ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget rowContainer(
      {required String imagePath,
      required String text,
      required String suffixIcon}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: double.infinity,
        height: 51,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Color(0xffffffff)),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset(
                    SvgAssets.path + imagePath,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  // See All
                  Text(text,
                      style: const TextStyle(
                          color: Color(0x8a4e6772),
                          fontWeight: FontWeight.w500,
                          //fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontSize: 15.0),
                      textAlign: TextAlign.left),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SvgPicture.asset(
                SvgAssets.path + suffixIcon,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rowTextShowAll({String? text, int? index}) {
    return GestureDetector(
      onTap: () {
        if (index == 1) {
          Navigator.pushNamed(context, TourProgramsScreen.routeName);
        } else if (index == 2) {
          Navigator.pushNamed(context, EmiratesTripScreen.routeName);
          //Navigator.pushNamed(context, TripsScreen);
        } else {
          Navigator.pushNamed(context, EmiratesTripScreen.routeName);
        }
      },
      child: SizedBox(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 15, bottom: 10, left: 5, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text!,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                      //fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0),
                  textAlign: TextAlign.left),
              Text("See All",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                      //fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 15.0),
                  textAlign: TextAlign.left)
            ],
          ),
        ),
      ),
    );
  }

  Widget eventProgram(
      {required String imageUrl, required Color color, required String title}) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, GroupScreen.routeName) ;
      },
      child: SizedBox(
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration:  BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300) ,
                  borderRadius: const BorderRadius.all(Radius.circular(12) ),
                  // color: Colors.white

              ),
              child: Center(
                  child: SvgPicture.asset(
                imageUrl,
                width: 35,
                height: 35,
              )),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(title,
                style: TextStyle(
                    color: Color(0xff415460),
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0),
                textAlign: TextAlign.left)
          ],
        ),
      ),
    );
  }

  Widget imageSlider(List<TripModel> tripProvider) {
    return Container(
      color: Colors.grey.shade100,
      height: 280.0,
      child: Stack(
        children: [
          ListView(
            children: [
              CarouselSlider(
                carouselController: _controller,
                items: tripProvider
                    .map((item) => SizedBox(
                          height: 300,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DetailTripScreen(item);
                              }));
                            },
                            child: Image.network(
                                Url.baseTripsImageUrl +
                                    item.images![0].imageUrl.toString(),
                                fit: BoxFit.cover,
                                width: 1000),
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                    height: 380.0,
                    enlargeCenterPage: false,
                    autoPlay: true,
                    disableCenter: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.easeInOut,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.black26,
                    ),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: const Text("Doubai -  UEA",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            //fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 20.0),
                        textAlign: TextAlign.left),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: tripProvider.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 12.0,
                          height: 12.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).primaryColor ==
                                          Brightness.light
                                      ? Colors.white
                                      : Colors.white)
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget tripProgram(List<TripProgramModel> tripProgramProvider) {
    return SizedBox(
      height: 211,
      child: SmartRefresher(
        physics: const BouncingScrollPhysics(),
        enableTwoLevel: false,
        enablePullDown: true,
        enablePullUp: true,
        controller: _refreshControllerDoctor2,
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
                : tripProgramProvider.isEmpty
                    ? const Center(child: Text('No Data'))
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, position) {
                          return ChangeNotifierProvider.value(
                            value: tripProgramProvider[position],
                            child: const TripProgramWidget(),
                          );
                        },
                        itemCount: tripProgramProvider.length,
                      ),
      ),
    );
  }
}
