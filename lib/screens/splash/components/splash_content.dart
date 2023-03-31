import 'package:flutter/cupertino.dart';

import '../../../utils/colors.dart';
import '../../../utils/dimensions.dart';

class SplashContent extends StatelessWidget {
  final String text, image;
  const SplashContent({
    super.key,
    required this.text,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          'MATH LAB',
          style: TextStyle(
              fontSize: getProportionateScreenWidth(36),
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold),
        ),
        Text(text, textAlign: TextAlign.center,),
        const Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        )
      ],
    );
  }
}
