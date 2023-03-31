import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class FormError extends StatelessWidget {
  const FormError({
    super.key,
    required this.errors,
  });

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(errors.length, (index) => formErrorText(error: errors[index])),
    );
  }

  Row formErrorText({ required String error}) {
    return Row(
        children: [
          Icon(Icons.error_outline, size: getProportionateScreenWidth(14), color: Colors.red,),
          SizedBox(
            width: getProportionateScreenWidth(10),
          ),
          Text(error, style: const TextStyle(color: Colors.red),)
        ],
      );
  }
}
