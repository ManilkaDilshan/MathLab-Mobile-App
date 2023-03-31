import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mathlab/screens/login/login.dart';
import 'package:mathlab/screens/sign_up/components/sign_up_form.dart';
import 'package:mathlab/utils/constants.dart';
import 'package:mathlab/utils/dimensions.dart';
import 'package:mathlab/widgets/no_account_text.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.screenHeight! * 0.04,
              ),
              Text(
                'Register Account',
                style: authHeadingStyle,
              ),
              const Text(
                'Register and complete account \nwith your details',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: Dimensions.screenHeight! * 0.04,
              ),
              const SignUpForm(),
              SizedBox(
                height: Dimensions.screenHeight! * 0.04,
              ),
              NoAccountText(
                  text1: 'Already have an account? ',
                  text2: 'Sign In',
                  routeName: LogIn.routeName),
            ],
          ),
        ),
      ),
    ));
  }
}
