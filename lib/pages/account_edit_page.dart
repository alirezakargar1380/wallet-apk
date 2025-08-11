import 'package:flutter/material.dart';
import 'package:wallet_3/controllers/account_controller.dart';
import 'package:wallet_3/main.dart';
import 'package:get/get.dart';

class AccountFormPage extends StatefulWidget {
  final Account? account;
  const AccountFormPage({super.key, this.account});

  @override
  State<AccountFormPage> createState() => _AccountFormPageState();
}

class _AccountFormPageState extends State<AccountFormPage> {
  final _formKey = GlobalKey<FormState>();

  AccountController accountController = Get.put(AccountController());

  String accid = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    accid = widget.account?.id.toString() ?? '';

    accountController.accNameController.text = widget.account?.acc_name ?? '';
    accountController.balanceController.text = widget.account?.balance.toString() ?? '0';
  }

  @override
  Widget build(BuildContext context) {
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
                    // title: Text("Account ID: $productId"),
                    title: Text("Account ID: $accid"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      spacing: 16.0,
                      children: [
                        TextFormField(
                          controller: accountController.accNameController,
                          decoration: InputDecoration(
                            labelText: 'Account Name',
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 10.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                color: Colors.black54,
                                width: 10.0,
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: accountController.balanceController,
                          decoration: InputDecoration(
                            labelText: 'Balance',
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 10.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                color: Colors.black54,
                                width: 10.0,
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
          ],
        ),
      ),
    );
  }
}