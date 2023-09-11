import 'package:flutter/material.dart';
import 'package:flutter_sdk/account.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AccountsUtil util = AccountsUtil.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            onPressed: () async {
              await util.getAccountAddress();
              //  util.createAccount();
            },
            child: const Text(
              "Generate Wallet",
            ),
          ),
          TextButton(
            onPressed: () async {
              
            var f =   await util.getBalance();
            util.getAccountPhrase();
            print(f.getInEther);
            },
            child: const Text(
              "check balance",
            ),
          ),
          TextButton(
            onPressed: () async {
              util.permanentlyDeleteAccount();
            },
            child: const Text(
              "Delete Wallet",
            ),
          ),
        ],
      ),
    );
  }
}
