import 'package:flutter/cupertino.dart';
import 'package:mathlab/utils/dimensions.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final TextOverflow overflow;
  const BigText(
      {Key? key,
      this.color=const Color(0xFF332d2b),
      required this.text,
      this.size=0,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size==0?getProportionateScreenWidth(18):size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
