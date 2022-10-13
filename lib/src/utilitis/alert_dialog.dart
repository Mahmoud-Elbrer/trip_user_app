import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';


Future<bool?> showAlert(context, String? title, String? desc) {
  return Alert(
    context: context,
    type: AlertType.error,
    title: title!,
    desc: desc!,
    buttons: [
      DialogButton(
        color: Theme.of(context).primaryColor,
        onPressed: () => Navigator.pop(context),
        width: 120,
        child: Text(
         'ok',
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      )
    ],
  ).show();
}

Future<bool?> showAlertSuccess(context, String? title, String? desc) {
  return Alert(
    context: context,
    type: AlertType.success,
    title: title,
    desc: desc,
    buttons: [
      DialogButton(
        color: Theme.of(context).primaryColor,
        onPressed: () => Navigator.pop(context),
        width: 120,
        child: const Text(
           'ok',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      )
    ],
  ).show();
}

Future<bool?> showDialogAlert(
    context, String? title, String? desc, Function deleteUserInfo) {
  return Alert(
    context: context,
    type: AlertType.warning,
    title: title,
    desc: desc,
    buttons: [
      DialogButton(
        color: Colors.orange,
        onPressed: deleteUserInfo as void Function()?,
        child: Text(
          "yes",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      DialogButton(
        color: Theme.of(context).primaryColor,
        child: Text(
         "NO",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () => Navigator.pop(context),
      )
    ],
  ).show();
}

Future<bool?> rateDoctorDialogAlert(
    BuildContext context) {
  final _formKey = GlobalKey<FormState>();
  return Alert(
      context: context,
      title: 'please_evaluate_the_doctor',
      desc: 'your_evaluation_help_us',
      style: AlertStyle(descStyle: TextStyle(color: Colors.grey,fontSize: 12)),
      content: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
// Rectangle 1014
            SizedBox(
              height: 10,
            ),
            // Directionality(
            //   textDirection: TextDirection.ltr,
            //   child: RatingBar(
            //     initialRating: 3,
            //     onRatingChanged: (rating) {},
            //     filledIcon: Icons.star,
            //     emptyIcon: Icons.star_border,
            //     halfFilledIcon: Icons.star_half,
            //     isHalfAllowed: true,
            //     filledColor: Colors.amberAccent,
            //     emptyColor: Colors.grey,
            //     halfFilledColor: Colors.amberAccent,
            //     size: 38,
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 307,
                height: 102,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border:
                        Border.all(color: Theme.of(context).primaryColor, width: 2),
                    color: const Color(0xffffffff)),
                child: TextFormField(
                //  controller: descriptionController,
                  maxLines: 4,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'this_field_cannot_be_empty';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    // icon: Icon(Icons.can),
                    hintText: 'comment_here',
                    //   labelText: 'Username',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      buttons: [
        DialogButton(
         color: Colors.white,
          child:   Text('submit',
              style:  TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w700,
                  // fontFamily: "Roboto",
                  fontStyle: FontStyle.normal,
                  fontSize: 18.0),
              textAlign: TextAlign.left),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // getCommnet = descriptionController.text;

              try {} catch (error) {
                ////print(error);
              }
            } else {
              ////print("validate ok");
            }
          },
        ),
        DialogButton(
          color: Colors.white,
          child:  Text('cancel',
              style: const TextStyle(
                  color: const Color(0xff5e6b6c),
                  fontWeight: FontWeight.w700,
                  // fontFamily: "Roboto",
                  fontStyle: FontStyle.normal,
                  fontSize: 16.0),
              textAlign: TextAlign.left),
          onPressed: () => Navigator.pop(context),
        )
      ]).show();
}
