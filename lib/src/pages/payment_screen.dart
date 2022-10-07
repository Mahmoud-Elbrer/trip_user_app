import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../utilitis/URL.dart';

class PaymentScreen extends StatefulWidget {
  final int? price;

  const PaymentScreen(this.price, {Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _loadHTML() {
    return '''
      <html>
        <body onload="document.f.submit();">
          <form id="f" name="f" method="post" action="http://192.168.137.1:3000/api/paypal/pay">
            <input type="hidden" name="amount" value="${widget.price}" />
          </form>
        </body>
      </html>
    ''';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        onPageFinished: (page) {
          // if (page.contains('/successPayment')) {
          //   Navigator.pop(context);
          // }

        },
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: Uri.dataFromString(_loadHTML(), mimeType: 'text/html').toString(),
        //initialUrl:  'http://192.168.137.1:3000/api/paypal/pay', //Uri.dataFromString(_loadHTML(), mimeType: 'text/html').toString(),
      ),

    );
  }
}
