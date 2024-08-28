import 'package:flutter/material.dart';
import 'package:stater_project/res/default_appbar.dart';

class StatementScreen extends StatelessWidget {
  const StatementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context: context, title: 'Statement'),
      body: Container(),
    );
  }
}
