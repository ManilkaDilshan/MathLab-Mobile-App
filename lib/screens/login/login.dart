import 'package:flutter/material.dart';
import 'package:mathlab/screens/login/components/body.dart';

class LogIn extends StatelessWidget {
  static String routeName = '/log_in';
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
