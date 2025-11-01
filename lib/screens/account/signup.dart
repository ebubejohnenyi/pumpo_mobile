import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_input.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<SignUp> {
  bool _createObscureText = true;
  bool _confirmObscureText = true;
  var _email = '';
  var _createPassword = '';
  var _confirmPassword = '';
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create your Account',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Create account with valid credentials',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
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
                    label: 'Email',
                    hintText: 'Email',
                    icon: Icons.email_outlined,
                    onValidate: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !emailRegex.hasMatch(value)) {
                        return 'Must be a valid address';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  CustomInput(
                    label: 'Create Password',
                    hintText: 'Create Password',
                    icon: Icons.lock_outline,
                    obscureText: _createObscureText,
                    suffixIconOnClick: () {
                      setState(() {
                        _createObscureText = !_createObscureText;
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
                      _createPassword = value!;
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  CustomInput(
                    label: 'Confirm Password',
                    hintText: 'Confirm Password',
                    icon: Icons.lock_outline,
                    obscureText: _confirmObscureText,
                    suffixIconOnClick: () {
                      setState(() {
                        _confirmObscureText = !_confirmObscureText;
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
                    title: 'Sign Up',
                    onClick: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }
                      context.go('/home');
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: AlignmentGeometry.bottomCenter,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Have account?',
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.copyWith(color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        context.go('/login');
                      },
                      child: Text(
                        "Login",
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              decoration: TextDecoration.underline,
                              decorationThickness: 2,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
