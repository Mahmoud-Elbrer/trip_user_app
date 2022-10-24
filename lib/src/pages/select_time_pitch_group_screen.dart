import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:trip_user_app/src/models/detail_group_view_model.dart';
import 'package:trip_user_app/src/pages/checkout_out_screen.dart';

import '../../config/routes/app_routes.dart';
import '../controllers/timetabel_group_provider.dart';
import '../elements/SelectTimePitchGroupWidget.dart';
import '../elements/rounded_button.dart';
import '../utilitis/data_connaction_alert.dart';

class SelectTimePitchGroupScreen extends StatefulWidget {
  static const String routeName = Routes.selectTimePitchGroupRoute;
  final DetailGroupViewModel detailGroupViewModel;

  const SelectTimePitchGroupScreen(this.detailGroupViewModel, {Key? key})
      : super(key: key);

  @override
  State<SelectTimePitchGroupScreen> createState() =>
      _SelectTimePitchGroupScreenState();
}

class _SelectTimePitchGroupScreenState
    extends State<SelectTimePitchGroupScreen> {
  void _refreshPage() async {
    setState(() {
      buildSelectTimePitchGroup(context);
    });
    //    await Provider.of<ProviderGetMedicalSpecialty>(context , listen: false).fetchMedicalSpecialty();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Time '),
      ),
      body: buildSelectTimePitchGroup(context),
    );
  }

  Widget buildSelectTimePitchGroup(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<TimetableGroupProvider>(context, listen: false)
          .fetchTimetableGroupProvider(
              groupId: widget.detailGroupViewModel.group![0].sId!),
      builder: (context, AsyncSnapshot snapShot) {
        switch (snapShot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: loadingSpinKitWanderingCubes(context));
            break;
          case ConnectionState.active:
            return Center(child: loadingSpinKitWanderingCubes(context));
            break;
          case ConnectionState.none:
            //  todo  handel error
            print("Errror2");
            return connectionError(context, _refreshPage);
            break;
          case ConnectionState.done:
            if (snapShot.hasError) {

              //  snapShot.error != null
              // todo  handel error data
              print("Errror1");
              print(snapShot.error.toString());
              return connectionError(context, _refreshPage);
            } else {
              final timetableGroupProvider =
                  Provider.of<TimetableGroupProvider>(context).data;



              return Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                    child: ChangeNotifierProvider.value(
                  value: timetableGroupProvider,
                  child: const SelectTimePitchGroupWidget(),
                )),
              );
            }
            break;
          default:
            return connectionError(context, _refreshPage);
        }
      },
    );
  }
}
