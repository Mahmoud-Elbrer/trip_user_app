import 'package:flutter/material.dart';
import 'package:trip_user_app/src/pages/payment_screen.dart';

import '../controllers/stripe_payment.dart';

class Payment extends StatefulWidget {

  Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int? price;

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
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(hintText: 'Enter Number'),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              price = int.parse(value);
            },
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PaymentScreen(price!);
                }));
              },
              child: const Text('Pay')),
          ElevatedButton(
              onPressed: () {
                payNow(price.toString())  ;
              },
              child: const Text('Strip')),
        ],
      ),
    );
  }
}
