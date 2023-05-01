import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
  static const routeName = '/404';
  const UnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
            "404 | Ops you are lost",
            style: TextStyle(fontSize: 22),
          )),
    );
  }
}
