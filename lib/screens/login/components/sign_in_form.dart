import 'package:flutter/material.dart';
import 'package:mathlab/screens/forgot_password/forgot_password_screen.dart';
import 'package:mathlab/screens/login_success/login_success_screen.dart';
import 'package:mathlab/widgets/auth_input_decoration.dart';
import 'package:mathlab/utils/colors.dart';
import 'package:mathlab/utils/constants.dart';
import 'package:mathlab/utils/dimensions.dart';
import 'package:mathlab/widgets/form_error.dart';

import '../../../widgets/default_button.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  late String email;
  late String password;
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
            Row(
              children: [
                Checkbox(
                  value: remember,
                  activeColor: AppColors.primaryColor,
                  onChanged: (value) {
                    setState(() {
                      remember = value!;
                    });
                  },
                ),
                const Text('Remember me'),
                const Spacer(),
                GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, ForgotPassword.routeName),
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            FormError(errors: errors),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            DefaultButton(
                text: 'Sign In',
                press: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (errors.isEmpty) {
                      Navigator.pushNamed(context, LoginSuccessScreen.routeName);
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
