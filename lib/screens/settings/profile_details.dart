import 'package:flutter/material.dart';

import '../../widget/custom_button.dart';
import '../../widget/settings_content.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile Details',
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFF8F8F8),
      ),
      body: Container(
        color: Color(0xFFF8F8F8),
        height: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SettingsContent(
                title: 'Account Name',
                hintTitle: 'Ebube John Enyi',
                suffixIcon: Icons.edit,
                onTap: () {},
              ),
              SettingsContent(
                title: 'Phone Number',
                hintTitle: '070123456789',
                suffixIcon: Icons.edit,
                onTap: () {},
              ),
              SettingsContent(
                title: 'Email',
                hintTitle: 'abcd@gmail.com',
                suffixIcon: Icons.edit,
                onTap: () {},
              ),
              SettingsContent(
                title: 'Date of Birth',
                hintTitle: 'March 1st 1994',
                suffixIcon: Icons.edit,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: CustomButton(title: 'Save', onClick: () {}),
        ),
      ),
    );
  }
}
