import 'package:flutter/material.dart';
import 'package:pfa_mobile_app/enums.dart';
import 'components/body.dart';

class UserProfile extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
