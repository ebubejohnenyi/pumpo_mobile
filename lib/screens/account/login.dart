import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/data/bloc/biometric/biometric_cubit.dart';
import 'package:mobile/widget/custom_button.dart';
import 'package:mobile/widget/custom_input.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  var _email = '';
  var _password = '';
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isBiometricEnabled = context.watch<BiometricCubit>().state;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 70.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back',
              style: TextTheme.of(
                context,
              ).titleLarge?.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Login with you pumpo credentials',
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
                    label: 'Password',
                    hintText: 'Password',
                    icon: Icons.lock_outline,
                    obscureText: _obscureText,
                    suffixIconOnClick: () {
                      setState(() {
                        _obscureText = !_obscureText;
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
                      _password = value!;
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        context.push('/forgotten-password');
                      },
                      child: Text(
                        'Forgotten Password?',
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              decoration: TextDecoration.underline,
                              decorationThickness: 2,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  CustomButton(
                    title: 'Login',
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
            if (isBiometricEnabled)
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            if (isBiometricEnabled)
              Center(
                child: Column(
                  children: [
                    Text('OR', style: Theme.of(context).textTheme.titleMedium),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.fingerprint_outlined, size: 55.0),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Text(
                      'Face ID or Finger Print',
                      style: Theme.of(context).textTheme.titleMedium,
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
                      "Didn't have account?",
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.copyWith(color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        context.go('/sign-up');
                      },
                      child: Text(
                        'Sign Up',
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
