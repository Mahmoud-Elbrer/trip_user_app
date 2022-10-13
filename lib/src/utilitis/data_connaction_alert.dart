import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget connectionError(BuildContext context, Function refreshPage) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        padding: const EdgeInsets.only(
          top: 25,
          bottom: 15,
        ),
        child: Center(
          child: SizedBox(
            child: Column(
              children: [
                const Text(
                  'error_try_again',
                  style: TextStyle(
                      color: Color(0xff1c2340),
                      fontWeight: FontWeight.w400,
                      // fontFamily: "Roboto",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  textAlign: TextAlign.center,
                ),
                FlatButton(
                  onPressed: refreshPage as void Function()? ,
                  shape: Border.all(width: .05),
                  child:  const Text(
                    'try_again',
                    style: TextStyle(
                        color: Color(0xff1c2340),
                        fontWeight: FontWeight.w800,
                        // fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontSize: 12.0),
                  ),
                ),
//            GestureDetector(
//              onTap: () {
//                refreshCar;
//              },
//              child: Container(
//                padding: EdgeInsets.all(10),
//                margin: EdgeInsets.all(10),
//                child: Text(
//                   'try'),
//                  style: TextStyle(
//                    color: Colors.red.shade300,
//                    fontSize: 15,
//                  ),
//                ),
//              ),
//            ),
//            FlatButton(
//              onPressed: refreshCar,
//              child: Container(
//                padding: EdgeInsets.all(10),
//                margin: EdgeInsets.all(10),
//                child: Text(
//                   'try'),
//                  style: TextStyle(
//                    color: Colors.red.shade300,
//                    fontSize: 15,
//                  ),
//                ),
//              ),
//            ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}


// Widget connectionErrorFu(BuildContext context,Future< Function> refreshCar) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       Container(
//         padding: EdgeInsets.only(
//           top: 25,
//           bottom: 15,
//         ),
//         child: Center(
//           child: SizedBox(
//             child: Column(
//               children: [
//                 Text(
//                   getTranslated(context, 'error_try_again')!,
//                   style: const TextStyle(
//                       color: const Color(0xff1c2340),
//                       fontWeight: FontWeight.w400,
//                       // fontFamily: "Roboto",
//                       fontStyle: FontStyle.normal,
//                       fontSize: 12.0),
//                 ),
//                 FlatButton(
//                   onPressed: () async{
//                     return  refreshCar ;
//                   },
//                   child: Text(
//                     getTranslated(context, 'try_again')!,
//                     style: const TextStyle(
//                         color: const Color(0xff1c2340),
//                         fontWeight: FontWeight.w800,
//                         // fontFamily: "Roboto",
//                         fontStyle: FontStyle.normal,
//                         fontSize: 12.0),
//                   ),
//                   shape: Border.all(width: .05),
//                 ),
// //            GestureDetector(
// //              onTap: () {
// //                refreshCar;
// //              },
// //              child: Container(
// //                padding: EdgeInsets.all(10),
// //                margin: EdgeInsets.all(10),
// //                child: Text(
// //                   'try'),
// //                  style: TextStyle(
// //                    color: Colors.red.shade300,
// //                    fontSize: 15,
// //                  ),
// //                ),
// //              ),
// //            ),
// //            FlatButton(
// //              onPressed: refreshCar,
// //              child: Container(
// //                padding: EdgeInsets.all(10),
// //                margin: EdgeInsets.all(10),
// //                child: Text(
// //                   'try'),
// //                  style: TextStyle(
// //                    color: Colors.red.shade300,
// //                    fontSize: 15,
// //                  ),
// //                ),
// //              ),
// //            ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     ],
//   );
// }



Widget notFoundWidget(BuildContext context, String title) {
  return Container(
    padding: const EdgeInsets.only(
      top: 25,
      bottom: 15,
    ),
    child: Center(
      child: SizedBox(
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                  color:  Color(0xff1c2340),
                  fontWeight: FontWeight.w800,
                  // fontFamily: "Roboto",
                  fontStyle: FontStyle.normal,
                  fontSize: 15.0),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget loading(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).primaryColor,
          ),
        ),
      ),
    ],
  );
}


Widget loadingSpinKitWanderingCubes(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
     //   width: 20,
        height: 25,
        child: SpinKitWanderingCubes(
          color: Theme.of(context).primaryColor,
        ),
      ),
    ],
  );
}


Widget circularProgressIndicator(BuildContext context){
  return CircularProgressIndicator( valueColor: AlwaysStoppedAnimation<Color>(
    Theme.of(context).primaryColor,
  ),);
}

