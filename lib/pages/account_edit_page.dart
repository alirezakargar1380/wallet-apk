import 'package:flutter/material.dart';

class AccountEditPage extends StatelessWidget {
  const AccountEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ??
        {};
    final productId = args['productId'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("edit account", style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.grey[500],
      body: Center(child: Text("Account $productId")),
    );
  }
}
