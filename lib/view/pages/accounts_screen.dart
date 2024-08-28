import 'package:flutter/material.dart';
import 'package:stater_project/res/default_appbar.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context: context,title: 'Account'),
      body: Container(),
    );
  }
}