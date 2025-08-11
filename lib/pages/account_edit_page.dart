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
      backgroundColor: Colors.grey[800],
      body: Container(
        child: Column(
          children: [
            Card(
              color: Colors.white70,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text("Account ID: $productId"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.black54,
                            width: 10.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
