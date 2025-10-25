import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/screens/forgotten_password/set_new_password.dart';
import 'package:mobile/widget/pin_code_input.dart';

import '../../widget/custom_button.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Verify Code',
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('We have sent code to'),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                Text(
                  'abdc@gmail.com',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Center(
              child: PinCodeInput(
                onCompleted: (code) {},
                length: 4,
                boxSize: 60,
                boxSpacing: 20,
                boxDecoration: BoxDecoration(color: Color(0xFFF5F5F5)),
                textStyle: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            CustomButton(
              title: 'Verify Code',
              onClick: () {
                context.go('/set-new-password');
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Didn't receive the code? "),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  Text(
                    'Click here',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      fontWeight: FontWeight.bold,
                    ),
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
