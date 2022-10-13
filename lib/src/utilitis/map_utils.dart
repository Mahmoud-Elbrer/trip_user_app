import 'package:url_launcher/url_launcher.dart';

class MapUtils {

  MapUtils._();

  static Future<void> openMap({required String latitude,required String longitude }) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunchUrl(Uri(scheme: 'https' ,  host: googleUrl))) {
      await launchUrl( Uri.parse(googleUrl) ,
        mode: LaunchMode.externalApplication,);
    } else {
      throw 'Could not open the map.';
    }
  }
}