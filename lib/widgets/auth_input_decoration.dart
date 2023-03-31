import 'package:flutter/material.dart';
import 'package:mathlab/utils/colors.dart';
import 'package:mathlab/utils/dimensions.dart';

InputDecoration authInputDecoration(
    String hintText, String labelText, IconData icon) {
  return InputDecoration(
      hintText: hintText,
      labelText: labelText,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28), gapPadding: 10),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: Colors.red),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: AppColors.primaryColor),
        gapPadding: 10,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: Colors.red),
        gapPadding: 10,
      ),
      suffixIcon: Padding(
        padding: EdgeInsets.fromLTRB(0, getProportionateScreenWidth(15),
            getProportionateScreenWidth(20), getProportionateScreenWidth(15)),
        child: Icon(icon),
      ));
}
