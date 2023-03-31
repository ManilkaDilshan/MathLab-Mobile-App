import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mathlab/screens/complete_profile/complete_profile.dart';
import 'package:mathlab/widgets/auth_input_decoration.dart';
import 'package:mathlab/utils/colors.dart';
import 'package:mathlab/utils/constants.dart';
import 'package:mathlab/widgets/default_button.dart';
import 'package:mathlab/utils/dimensions.dart';
import 'package:mathlab/widgets/form_error.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  late String email;
  late String password;
  String? confirmPassword;
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            emailInputField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            passwordInputField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            passwordConfirmField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            FormError(errors: errors),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            DefaultButton(
                text: 'Continue',
                press: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (errors.isEmpty) {
                      Navigator.pushNamed(
                          context, CompleteProfile.routeName);
                    }
                  }
                },
                backgroundColor: AppColors.primaryColor)
          ],
        ));
  }

  TextFormField passwordInputField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue!,
      obscureText: true,
      decoration: authInputDecoration(
          'Enter your password', 'Password', Icons.lock_outline),
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
        setState(() {
            errors.remove(kMatchPassError);
          });
        password = value;
        return;
      },
      validator: (value) {
        if (value!.isEmpty &&
            !errors.contains(kPassNullError) &&
            !errors.contains(kEmailNullError) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.clear();
            errors.add(kPassNullError);
          });
        } else if (value.length < 8 &&
            !errors.contains(kShortPassError) &&
            !errors.contains(kPassNullError) &&
            !errors.contains(kEmailNullError) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.clear();
            errors.add(kShortPassError);
          });
        }
        return null;
      },
    );
  }

  TextFormField passwordConfirmField() {
    return TextFormField(
      onSaved: (newValue) => confirmPassword = newValue!,
      obscureText: true,
      decoration: authInputDecoration(
          'Re-enter your password', 'Confirm Password', Icons.lock_outline),
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kMatchPassError)) {
          setState(() {
            errors.remove(kMatchPassError);
          });
        }
        return;
      },
      validator: (value) {
        if ((value!.isEmpty || password != confirmPassword) &&
            errors.isEmpty) {
          setState(() {
            errors.add(kMatchPassError);
          });
        }
        return null;
      },
    );
  }

  TextFormField emailInputField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.clear();
            errors.add(kEmailNullError);
          });
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError) &&
            !errors.contains(kEmailNullError)) {
          setState(() {
            errors.clear();
            errors.add(kInvalidEmailError);
          });
        }
        return null;
      },
      decoration:
          authInputDecoration('Enter your email', 'Email', Icons.mail_outline),
    );
  }
}
