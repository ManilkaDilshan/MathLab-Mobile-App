import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mathlab/screens/forgot_password/components/forgot_password_form.dart';
import 'package:mathlab/screens/forgot_password/forgot_password_screen.dart';
import 'package:mathlab/screens/sign_up/sign_up.dart';
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
        physics:
            const ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.screenHeight! * 0.04,
              ),
              Text(
                'Forgot Password',
                style: authHeadingStyle,
              ),
              const Text(
                'Please enter your email and we will send \nyou a link to reset your password',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: Dimensions.screenHeight! * 0.06,
              ),
              const ForgotPasswordForm(),
              SizedBox(
                height: Dimensions.screenHeight! * 0.06,
              ),
              NoAccountText(text1: 'Don\'t have an account? ', text2: 'Sign Up', routeName: SignUp.routeName)
            ],
          ),
        ),
      ),
    ));
  }
}
