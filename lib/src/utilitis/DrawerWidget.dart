import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              // currentUser.value.apiToken != null ? //Navigator.of(context).pushNamed('/Profile') : //Navigator.of(context).pushNamed('/Login');
            },
            child: "--" != null
                ? UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).hintColor.withOpacity(0.1),
                    ),
                    accountName: Text(
                      "UserName",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    accountEmail: Text(
                      'app_name',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    currentAccountPicture: Stack(
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(80)),
                            child: Image.asset('assets/images/logo.png'),
                          ),
                        ),
//                        Positioned(
//                          top: 0,
//                          right: 0,
//                          child: currentUser.value.verifiedPhone ?? false
//                              ? Icon(
//                                  Icons.check_circle,
//                                  color: Theme.of(context).accentColor,
//                                  size: 24,
//                                )
//                              : SizedBox(),
//                        )
                      ],
                    ),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Theme.of(context).hintColor.withOpacity(0.1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("welcome",
                            style: Theme.of(context).textTheme.headline4!.merge(
                                TextStyle(
                                    color: Theme.of(context).accentColor))),
                        SizedBox(height: 5),
                        Text("loginAccountOrCreateNewOneForFree",
                            style: Theme.of(context).textTheme.bodyText2),
                        SizedBox(height: 15),
                        Wrap(
                          spacing: 10,
                          children: <Widget>[
                            MaterialButton(
                              elevation: 0,
                              onPressed: () {
                                //Navigator.of(context).pushNamed('/Login');
                              },
                              color: Theme.of(context).accentColor,
                              height: 40,
                              shape: StadiumBorder(),
                              child: Wrap(
                                runAlignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 9,
                                children: [
                                  Icon(Icons.exit_to_app,
                                      color: Theme.of(context).primaryColor,
                                      size: 24),
                                  Text(
                                    "login",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .merge(TextStyle(
                                            color: Theme.of(context)
                                                .primaryColor)),
                                  ),
                                ],
                              ),
                            ),
                            MaterialButton(
                              elevation: 0,
                              color:
                                  Theme.of(context).focusColor.withOpacity(0.2),
                              height: 40,
                              onPressed: () {
                                //Navigator.of(context).pushNamed('/SignUp');
                              },
                              child: Wrap(
                                runAlignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 9,
                                children: [
                                  Icon(Icons.person_add,
                                      color: Theme.of(context).hintColor,
                                      size: 24),
                                  Text(
                                    "register",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .merge(TextStyle(
                                            color:
                                                Theme.of(context).hintColor)),
                                  ),
                                ],
                              ),
                              shape: StadiumBorder(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          ),
          ListTile(
            onTap: () {
              //Navigator.pop(context);
              //Navigator.of(context).pushNamed(DashboardScreen.routeName);
            },
            leading: Icon(
              Icons.home,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              'text' ,//(context, 'home')!,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            onTap: () {
              //Navigator.pop(context);
              //Navigator.of(context).pushNamed(BookingScreen.routeName);
            },
            leading: Icon(
              Icons.notifications_none,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              'text' ,//(context, 'booking_history')!,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            onTap: () {
              //Navigator.pop(context);
              //Navigator.of(context).pushNamed(BookingHistoryScreen.routeName);
            },
            leading: Icon(
              Icons.local_mall,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              'text' ,//(context, 'Order_history')!,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            onTap: () {
              //Navigator.pop(context);
              //Navigator.of(context).pushNamed(NotificationScreen.routeName);
            },
            leading: Icon(
              Icons.favorite,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              'text' ,//(context, 'notification')!,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            onTap: () {
              //Navigator.pop(context);
              //Navigator.of(context).pushNamed(FavoriteDoctorScreen.routeName);
            },
            leading: Icon(
              Icons.chat,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              'text' ,//(context, 'favorite')!,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            dense: true,
            title: Text(
              'text' ,//(context, 'search_doctor_by')!,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            trailing: Icon(
              Icons.remove,
              color: Theme.of(context).focusColor.withOpacity(0.3),
            ),
          ),
          ListTile(
            onTap: () {
              //Navigator.pop(context);
              //Navigator.of(context).pushNamed(MedicalSpecialtiesScreen.routeName);
            },
            leading: Icon(
              Icons.scatter_plot,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              'text' ,//(context, 'by_specialty')!,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            onTap: () {
              //Navigator.pop(context);
              //Navigator.of(context).pushNamed(MedicalCenterScreen.routeName);
            },
            leading: Icon(
              Icons.business_center,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              'text' ,//(context, 'by_medical_center')!,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            onTap: () {
              //Navigator.pop(context);
              //Navigator.of(context).pushNamed(CityScreen.routeName);
            },
            leading: Icon(
              Icons.location_city,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              'text' ,//(context, 'by_city')!,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            dense: true,
            title: Text(
              'text' ,//(context, 'other_settings')!,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            trailing: Icon(
              Icons.remove,
              color: Theme.of(context).focusColor.withOpacity(0.3),
            ),
          ),
          ListTile(
            onTap: () {
              //Navigator.pop(context);
              //Navigator.of(context).pushNamed(MyProfileScreen.routeName);
            },
            leading: Icon(
              Icons.person_pin,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              'text' ,//(context, 'my_profile')!,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            onTap: () {
              // //Navigator.of(context).pushNamed('/Help');
            },
            leading: Icon(
              Icons.help_outline,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              'text' ,//(context, 'help_support')!,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            onTap: () {
              //Navigator.pop(context);
              //Navigator.of(context).pushNamed(SettingScreen.routeName);
            },
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              'text' ,//(context, 'settings')!,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            onTap: () {
              //Navigator.pop(context);
              //Navigator.of(context).pushNamed(ChangeLanguageScreen.routeName);
            },
            leading: Icon(
              Icons.translate,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              'text' ,//(context, 'language')!,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            onTap: () {
            },
            leading: Icon(
              Icons.share,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              'text' ,//(context, 'share_app')!,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.star_half,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              'text' ,//(context, 'rate_app')!,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
//          ListTile(
//            onTap: () {},
//            leading: Icon(
//              Icons.brightness_6,
//              color: Theme.of(context).focusColor.withOpacity(1),
//            ),
//            title: Text(
//              'text' ,//(context, 'mode_light'),
//              style: Theme.of(context).textTheme.subtitle1,
//            ),
//          ),
          ListTile(
            onTap: () {
            },
            leading: Icon(
              Icons.exit_to_app,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              'text' ,//(context, 'logout')!,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> showDialog(context, String? title, String? desc) {
    return Alert(
      context: context,
      type: AlertType.warning,
      title: title,
      desc: desc,
      buttons: [
        DialogButton(
          color: Colors.orange,
          child: Text(
            'text' ,//(context, 'yes')!,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () => deleteUserInfo(context),
        ),
        DialogButton(
          color: Theme.of(context).primaryColor,
          child: const Text(
            'text' ,//(context, 'no')!,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        )
      ],
    ).show();
  }

  deleteUserInfo(BuildContext context) async {
    // //Navigator.pop(context);
    SharedPreferences preferences = await SharedPreferences.getInstance();
  //  preferences.setBool(ConstantSharedPreferences.seenAuth, false);
    //Navigator.of(context).pushNamedAndRemoveUntil(SignInScreen.routeName, (Route<dynamic> route) => false);
  }
}
