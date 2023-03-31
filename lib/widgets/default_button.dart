import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final GestureTapCallback press;
  final Color backgroundColor;
  const DefaultButton({
    super.key, required this.text, required this.press, required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(50),
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          backgroundColor:
              MaterialStateProperty.all<Color>(backgroundColor),
        ),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
              fontSize: getProportionateScreenWidth(18), color: Colors.white),
        ),
      ),
    );
  }
}
