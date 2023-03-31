
import 'package:flutter/cupertino.dart';
import 'package:mathlab/utils/colors.dart';

import '../utils/dimensions.dart';

class NoAccountText extends StatelessWidget {
  final String text1, text2, routeName;
  const NoAccountText({
    super.key, required this.text1, required this.text2, required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: TextStyle(fontSize: getProportionateScreenWidth(14)),
        ),
        GestureDetector(
          onTap: () =>
              Navigator.popAndPushNamed(context, routeName),
          child: Text(
            text2,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(14),
                color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
