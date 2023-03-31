import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mathlab/screens/complete_profile/complete_profile.dart';
import 'package:mathlab/widgets/auth_input_decoration.dart';
import 'package:mathlab/utils/colors.dart';
import 'package:mathlab/utils/constants.dart';
import 'package:mathlab/widgets/default_button.dart';
import 'package:mathlab/utils/dimensions.dart';
import 'package:mathlab/widgets/form_error.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({super.key});

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  late String firstName;
  late String lastName;
  late String phone;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            firstNameInputField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            lastNameInputField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            phoneInputField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            FormError(errors: errors),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            DefaultButton(
                text: 'Complete Registration',
                press: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (errors.isEmpty) {
                      Navigator.pushNamed(context, CompleteProfile.routeName);
                    }
                  }
                },
                backgroundColor: AppColors.primaryColor)
          ],
        ));
  }

  TextFormField firstNameInputField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => firstName = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kRequiredFieldError)) {
          setState(() {
            errors.remove(kRequiredFieldError);
          });
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kRequiredFieldError)) {
          setState(() {
            errors.clear();
            errors.add(kRequiredFieldError);
          });
        }
        return;
      },
      decoration: authInputDecoration(
          'Enter your first name', 'First Name', Icons.person_outline),
    );
  }

  TextFormField lastNameInputField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => lastName = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kRequiredFieldError)) {
          setState(() {
            errors.remove(kRequiredFieldError);
          });
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kRequiredFieldError)) {
          setState(() {
            errors.clear();
            errors.add(kRequiredFieldError);
          });
        }
        return;
      },
      decoration: authInputDecoration(
          'Enter your last name', 'Last Name', Icons.person_outline),
    );
  }

  TextFormField phoneInputField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => phone = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kRequiredFieldError)) {
          setState(() {
            errors.remove(kRequiredFieldError);
          });
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kRequiredFieldError)) {
          setState(() {
            errors.clear();
            errors.add(kRequiredFieldError);
          });
        }
        return;
      },
      decoration: authInputDecoration(
          'Enter your phone number', 'Phone Number', Icons.phone_android_outlined),
    );
  }
}
