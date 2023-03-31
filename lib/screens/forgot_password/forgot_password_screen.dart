import 'package:flutter/material.dart';
import 'package:mathlab/screens/forgot_password/components/body.dart';

class ForgotPassword extends StatelessWidget {
  static String routeName = '/forgot_password';
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
