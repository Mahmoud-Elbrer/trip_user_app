import '../utilitis/calls_and_messages_service.dart';
import 'package:get_it/get_it.dart';


GetIt? locator ;

void setupLocator() {
  locator!.registerSingleton(CallsAndMessagesService());
}