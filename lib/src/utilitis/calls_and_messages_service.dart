import 'package:url_launcher/url_launcher.dart';

class CallsAndMessagesService {
 // void call(String? number) => launchUrl("tel://$number");
  void call(String? number) => launchUrl(Uri(scheme: 'tel' , host: '$number'));

  void sendSms(String? number) => launch("sms:$number");

  void sendEmail(String email) => launch("mailto:$email");
}