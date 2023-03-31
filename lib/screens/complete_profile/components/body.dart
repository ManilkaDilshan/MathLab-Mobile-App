import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:mathlab/screens/complete_profile/components/complete_profile.form.dart';
import 'package:mathlab/screens/login/login.dart';
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
            const ClampingScrollPhysics(),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.screenHeight! * 0.04,
              ),
              Text(
                'Complete Profile',
                style: authHeadingStyle,
              ),
              const Text(
                'Complete your profile fo move forward',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: Dimensions.screenHeight! * 0.04,
              ),
              const CompleteProfileForm(),
            ],
          ),
        ),
      ),
    ));
  }
}
