import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: const Center(
        child: Text('This is The Payment Page'),
      )
    );
  }
}