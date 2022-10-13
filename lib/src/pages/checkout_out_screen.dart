import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trip_user_app/src/models/trip_model.dart';
import 'package:trip_user_app/src/pages/payment_screen.dart';
import '../../config/routes/app_routes.dart';
import '../controllers/stripe_payment.dart';
import '../elements/custom_email_textfield.dart';
import '../elements/custom_phone_number_textfield.dart';
import '../elements/rounded_button.dart';
import '../elements/rounded_name_textfield.dart';
import '../utilitis/assets_manger.dart';

class CheckoutOutScreen extends StatefulWidget {
  static const String routeName = Routes.checkoutOutRoute;
  final TripModel tripModel;
  final String selectedDate;

  final TimeOfDay selectedTime;

  const CheckoutOutScreen(
      {super.key,
      required this.tripModel,
      required this.selectedDate,
      required this.selectedTime});

  @override
  State<CheckoutOutScreen> createState() => _CheckoutOutScreenState();
}

enum Residency { residency, visitor }

enum PaymentBy { visa, master }

class _CheckoutOutScreenState extends State<CheckoutOutScreen> {
  Residency residencySelected = Residency.visitor;
  PaymentBy paymentSelected = PaymentBy.visa;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StripeServices.init();
  }

  void payNow(String amount) async {
    //the amount must be transformed to cents
    var response =
    await StripeServices.payNowHandler(amount: amount, currency: 'USD');
    print('response message ${response.message}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
        color: const Color(0xfff1f9ff),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title(title: 'How do you wish to  pay'),
              paymentMethode(
                  paymentMethode: PaymentBy.visa,
                  imagePath: 'visa.svg',
                  text: 'Visa'),
              paymentMethode(
                  paymentMethode: PaymentBy.master,
                  imagePath: 'mastercard.svg',
                  text: 'Master'),
              title(title: 'Order Summary'),
              const SizedBox(
                height: 10,
              ),
              // Rectangle 7
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                //margin: const EdgeInsets.symmetric(vertical: 20 ,horizontal: 10),
                // height: 151,
                decoration: const BoxDecoration(color: Color(0xffffffff)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textSummery(title: 'Your Time :'),
                    textSummery(title: '12-12-2022 10:20 PM'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textSummery(title: '3 Adult'),
                        textSummery(title: '321 AED'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textSummery(title: '3 Child'),
                        textSummery(title: '321 AED'),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        // The Caribbean is a region of the Americas that consists of the Caribbean Sea, its islands and the surrounding coasts.
                        Text("Total",
                            style: TextStyle(
                                color: Color(0xffdf7700),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 14.0),
                            textAlign: TextAlign.left),
                        Text("642 AED",
                            style: TextStyle(
                                color: Color(0xffdf7700),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 14.0),
                            textAlign: TextAlign.left)
                      ],
                    ),
                  ],
                ),
              ),

              title(title: 'Fill more detiels'),
              const SizedBox(
                height: 10,
              ),
              const RoundedNameTextField(text: 'Name'),
              const SizedBox(
                height: 10,
              ),
              const CustomEmailField(text: 'Email'),
              const SizedBox(
                height: 10,
              ),
              const CustomPhoneNumberTextField(text: 'Phone'),
              const SizedBox(
                height: 10,
              ),

              // See All
              const Text("Residency",
                  style: TextStyle(
                      color: Color(0x8a4e6772),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.normal,
                      fontSize: 15.0),
                  textAlign: TextAlign.left),

              Wrap(
                children: [
                  ListTile(
                    title: const Text('Visitor'),
                    leading: Radio(
                      value: Residency.visitor,
                      groupValue: residencySelected,
                      onChanged: (Residency? value) {
                        setState(() {
                          residencySelected = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Residency'),
                    leading: Radio(
                      value: Residency.residency,
                      groupValue: residencySelected,
                      onChanged: (Residency? value) {
                        setState(() {
                          residencySelected = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),

               RoundedButton(
                text: 'Next',
                press: () {
                  if(paymentSelected == PaymentBy.visa){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const PaymentScreen(200);
                    }));
                  }else {
                    payNow("220")  ;
                  }

                },
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget paymentMethode(
      {required String imagePath,
      required String text,
      required PaymentBy paymentMethode}) {
    return Container(
      width: double.infinity,
      // height: 50,
      padding: const EdgeInsets.symmetric(vertical: 12),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: const Color(0xffe7d8d8), width: 1),
          color: const Color(0xffffffff)),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Row(
          children: [
            Radio(
              value: paymentMethode,
              groupValue: paymentSelected,
              onChanged: (PaymentBy? value) {
                setState(() {
                  paymentSelected = value!;
                });
              },
            ),
            SvgPicture.asset(
              SvgAssets.path + imagePath,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: const TextStyle(
                  color: Color(0xff8898a1),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins",
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}

Widget title({required String title}) {
  return Opacity(
    opacity: 0.8399999737739563,
    child: Text(title,
        style: const TextStyle(
            color: Color(0xff000000),
            fontWeight: FontWeight.w500,
            fontFamily: "Poppins",
            fontStyle: FontStyle.normal,
            fontSize: 22.0),
        textAlign: TextAlign.left),
  );
}

Widget textSummery({required String title}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 2),
    child: Text(title,
        style: const TextStyle(
            color: Color(0xff8898a1),
            fontWeight: FontWeight.w400,
            fontFamily: "Poppins",
            fontStyle: FontStyle.normal,
            fontSize: 14.0),
        textAlign: TextAlign.left),
  );
}
