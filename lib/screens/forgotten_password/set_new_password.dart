import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/screens/account/login.dart';
import 'package:mobile/widget/custom_button.dart';
import 'package:mobile/widget/custom_input.dart';

class SetNewPassword extends StatefulWidget {
  const SetNewPassword({super.key});

  @override
  State<SetNewPassword> createState() {
    return _SetNewPasswordState();
  }
}

class _SetNewPasswordState extends State<SetNewPassword> {
  bool _obscureNewPasswordText = true;
  bool _obscureConfirmPasswordText = true;
  var _newPassword = '';
  var _confirmPassword = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Set New Password',
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Must be atleast 8 characters long',
              style: TextTheme.of(context).titleSmall?.copyWith(
                fontWeight: FontWeight.w400,
                color: ColorScheme.of(context).outline,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInput(
                    label: 'Create Password',
                    hintText: 'Create Password',
                    icon: Icons.lock_outline,
                    obscureText: _obscureNewPasswordText,
                    suffixIconOnClick: () {
                      setState(() {
                        _obscureNewPasswordText = !_obscureNewPasswordText;
                      });
                    },
                    onValidate: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length <= 7) {
                        return 'Password must be over 7 characters';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _newPassword = value!;
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  CustomInput(
                    label: 'Confirm Password',
                    hintText: 'Confirm Password',
                    icon: Icons.lock_outline,
                    obscureText: _obscureConfirmPasswordText,
                    suffixIconOnClick: () {
                      setState(() {
                        _obscureConfirmPasswordText =
                            !_obscureConfirmPasswordText;
                      });
                    },
                    onValidate: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length <= 7) {
                        return 'Password must be over 7 characters';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _confirmPassword = value!;
                    },
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  CustomButton(
                    title: 'Set New Password',
                    onClick: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }
                      context.go('/login');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
