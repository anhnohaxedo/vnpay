import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';
import 'package:vnpay/services/payment_service.dart';
import 'package:vnpay/view/return_screen.dart';
import 'package:vnpay/models/return_url.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage(this.amount, {Key? key, required this.title})
      : super(key: key);
  final String title;
  final String amount;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: WebView(
        initialUrl: getPaymentUrl(widget.amount),
        javascriptMode: JavascriptMode.unrestricted,
        navigationDelegate: (NavigationRequest request) {
          if (request.url.startsWith('vnpaysample://vnpaytesting.com')) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ReturnScreen(ReturnUrl(request.url).responseDetail)));
            print('blocking navigation to $request}');
            return NavigationDecision.prevent;
          }

          print('allowing navigation to $request');
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}
