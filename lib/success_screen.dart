import 'package:flutter/material.dart';
import 'package:link_me/success_Screen_body.dart';

class SuccessScreen extends StatelessWidget {
  static String routeName = "/success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
      ),
      body: Body(),
    );
  }
}