import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mathlab/screens/complete_profile/components/body.dart';

class CompleteProfile extends StatelessWidget {
  static String routeName = '/complete_profile';
  const CompleteProfile({super.key});

   @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
