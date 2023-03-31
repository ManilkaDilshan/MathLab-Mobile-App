import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mathlab/root_page.dart';
import 'package:mathlab/utils/colors.dart';
import 'package:mathlab/utils/constants.dart';
import 'package:mathlab/widgets/default_button.dart';
import 'package:mathlab/utils/dimensions.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          'assets/images/success.png',
          height: Dimensions.screenHeight! * 0.4,
        ),
        const Spacer(),
        Text(
          'Login Successful',
          style: authHeadingStyle,
        ),
        const Spacer(),
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: DefaultButton(
                text: 'Back to Home',
                press: () {
                  Navigator.pushNamed(context, RootPage.routeName);
                },
                backgroundColor: AppColors.primaryColor)),
        const Spacer()
      ],
    );
  }
}
