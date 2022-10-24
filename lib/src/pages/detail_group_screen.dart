import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/routes/app_routes.dart';
import '../controllers/detail_group_provider.dart';
import '../elements/detail_group_widget.dart';
import '../models/group_view_model.dart';
import '../utilitis/data_connaction_alert.dart';

class DetailGroupScreen extends StatefulWidget {
  static const String routeName = Routes.detailTripRoute;
  final GroupViewModel groupViewModel;

  const DetailGroupScreen(this.groupViewModel, {Key? key}) : super(key: key);

  @override
  State<DetailGroupScreen> createState() => _DetailGroupScreenState();
}

class _DetailGroupScreenState extends State<DetailGroupScreen> {
  void _refreshPage() async {
    setState(() {
      buildDetailGroup(context);
    });
    //    await Provider.of<ProviderGetMedicalSpecialty>(context , listen: false).fetchMedicalSpecialty();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rihla'),
        centerTitle: true,
      ),
      body: Container(
        child: buildDetailGroup(context),
      ),
    );
  }

  Widget buildDetailGroup(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<DetailGroupProvider>(context, listen: false)
          .fetchDetailGroupProvider(groupId: widget.groupViewModel.sId!),
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
            return connectionError(context, _refreshPage);
            break;
          case ConnectionState.done:
            if (snapShot.hasError) {
              //  snapShot.error != null
              // todo  handel error data
              return connectionError(context, _refreshPage);
            } else {
              final detailGroupProvider =
                  Provider.of<DetailGroupProvider>(context).data;
              print("length");
              print(detailGroupProvider);

              return Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                    child: ChangeNotifierProvider.value(
                  value: detailGroupProvider,
                  child: const DetailGroupWidget(),
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
