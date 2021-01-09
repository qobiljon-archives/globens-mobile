import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class ProductPurchaseScreen extends StatefulWidget {
  @override
  _ProductPurchaseScreenState createState() => _ProductPurchaseScreenState();
}

class _ProductPurchaseScreenState extends State<ProductPurchaseScreen> {
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
            loadInicisPaymentHTML();
          },
        ),
      ),
    );
  }

  void loadInicisPaymentHTML() async {
    var res = await http.post('https://mobile.inicis.com/smart/payment/', body: <String, String>{
      'P_INI_PAYMENT': 'CARD',
      'P_MID': 'INIpayTest',
      'P_OID': 'INIpayTest_123456',
      'P_GOODS': 'test product',
      'P_AMT': '1000',
      'P_UNAME': 'Hong Gil Dong',
      // 'P_NEXT_URL': '',
      // 'P_NOTI_URL': '',
      'P_HPP_METHOD': '1',
      'P_MNAME': 'Test store',
      'P_MOBILE': '010-1234-5678',
      'P_EMAIL': 'test@test.com',
      'P_OFFER_PERIOD': '2020091620200916',
      'P_CHARSET': 'utf8',
      // 'P_NOTI': '',
      'P_TAX': '100',
      'P_TAXFREE': '1000',
      'P_QUOTABASE': '01:02:03:04:05',
      'P_CARD_OPTION': 'selcode=14',
      'P_VBANK_DT': '20201010',
      'P_VBANK_TM': '2030',
      'P_RESERVED': 'below1000=Y&bank_receipt=N',
    });
    if (res.statusCode == 200) {
      print(res.body);
      _controller.loadUrl(Uri.dataFromString(
        res.body,
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8'),
      ).toString());
      print('entered');
    } else {
      Navigator.of(context).pop();
      print('exited ${res.statusCode}');
    }
  }
}
