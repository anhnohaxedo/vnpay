import 'package:flutter/material.dart';
import 'package:vnpay/services/vnpay.dart';

class PaymentInfo extends StatefulWidget {
  const PaymentInfo({Key? key}) : super(key: key);
  @override
  State<PaymentInfo> createState() => PaymentInfoState();
}

class PaymentInfoState extends State<PaymentInfo> {
  final TextEditingController amountController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Info'),
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: TextField(
            style: const TextStyle(fontSize: 30),
            decoration: const InputDecoration(
                hintText: 'Amount', hintStyle: TextStyle(fontSize: 30)),
            controller: amountController,
          ),
        ),
        ElevatedButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(amountController.value.text,
                      title: 'Payment'))),
          child: const Text('Pay'),
        )
      ]),
    );
  }
}
