import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utilitis/constance.dart';
import '../utilitis/not_register_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  bool seenAuth = false;
  late String? name  ,email  ,imageUrl;

  Future<void> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // isAuth ??= false;
    setState(() {
      seenAuth = prefs.getBool(Constance.seenAuth)!;
      name = prefs.getString(Constance.name)!;
      email = prefs.getString(Constance.email)!;
      imageUrl = prefs.getString(Constance.imageUrl)!;
      print("this imageUrl");
      print(imageUrl);
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //isEnableCont = false;
    getSharedPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: seenAuth ? Container(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Ellipse 1
                  Container(
                      width: 145.6551513671875,
                      height: 145.6552734375,
                      decoration: const BoxDecoration(
                          color: Color(0xffadb4c2), shape: BoxShape.circle ,),
                      child: Image.network('imageUrl!')),
                ],
              ),

              const SizedBox(
                height: 13,
              ),
              // Mahmoud Abdalla
               Text(name! ,
                  style: const TextStyle(
                      color:  Color(0xff242134),
                      fontWeight: FontWeight.w700,
                      fontFamily: "SFProText",
                      fontStyle: FontStyle.normal,
                      fontSize: 35.0),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 13,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  columnProfile(title: 'Username', subTitle: name!),
                  columnProfile(title: 'Email', subTitle: email!),

                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/logout.svg'),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("Logout",
                            style: TextStyle(
                                color: Color(0xff242134),
                                fontWeight: FontWeight.w400,
                                fontFamily: "SFProText",
                                fontStyle: FontStyle.normal,
                                fontSize: 17.0),
                            textAlign: TextAlign.left)
                      ],
                    ),
                  ),
                  // text
                  const Text("Edit",
                      style: TextStyle(
                          color: Color(0xffff7346),
                          fontWeight: FontWeight.w500,
                          fontFamily: "SFProText",
                          fontStyle: FontStyle.normal,
                          fontSize: 15.0),
                      textAlign: TextAlign.left)
                ],
              ),
            ],
          ) ,
        ) : const Center( child:  NotRegisterWidget(),),
      ),
    );
  }

  Widget columnProfile({required title, required subTitle}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Opacity(
            opacity: 0.30000001192092896,
            child: Text(title,
                style: const TextStyle(
                    color: Color(0xff223269),
                    fontWeight: FontWeight.w400,
                    fontFamily: "SFProText",
                    fontStyle: FontStyle.normal,
                    fontSize: 15.0),
                textAlign: TextAlign.left),
          ),
          const SizedBox(
            height: 12,
          ),
          // text
          Text(subTitle,
              style: const TextStyle(
                  color: Color(0xff242134),
                  fontWeight: FontWeight.w400,
                  fontFamily: "SFProText",
                  fontStyle: FontStyle.normal,
                  fontSize: 17.0),
              textAlign: TextAlign.left)
        ],
      ),
    );
  }
}
