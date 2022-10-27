import 'package:flutter/material.dart';

class ReturnScreen extends StatelessWidget {
  final String result;
  ReturnScreen(this.result) : super(key: UniqueKey());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(result)),
      body: Container(
        alignment: Alignment.center,
        child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Back to home')),
      ),
    );
  }
}
