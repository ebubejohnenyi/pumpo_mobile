import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/screens/settings/customer_support.dart';
import 'package:mobile/screens/settings/languages.dart';
import 'package:mobile/screens/settings/manage_card.dart';
import 'package:mobile/screens/settings/profile_details.dart';
import 'package:mobile/screens/settings/security.dart';
import 'package:mobile/widget/settings_content.dart';

import '../../widget/custom_button.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingsContent(
                title: 'Profile Details',
                suffixIcon: Icons.arrow_forward_ios,
                onTap: () {
                  context.push('/profile-detail');
                },
              ),
              SettingsContent(
                title: 'Customer Support',
                suffixIcon: Icons.arrow_forward_ios,
                onTap: () {
                  context.push('/customer-support');
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Text(
                'Services',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
              SettingsContent(
                title: 'Referrals',
                suffixIcon: Icons.arrow_forward_ios,
                onTap: () {},
              ),
              SettingsContent(
                title: 'Languages',
                suffixIcon: Icons.arrow_forward_ios,
                onTap: () {
                  context.push('/language');
                },
              ),
              SettingsContent(
                title: 'Security',
                suffixIcon: Icons.arrow_forward_ios,
                onTap: () {
                  context.push('/security');
                },
              ),
              SettingsContent(
                title: 'Manage Card',
                suffixIcon: Icons.arrow_forward_ios,
                onTap: () {
                  context.push('/manage-card');
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: CustomButton(
            title: 'Logout',
            onClick: () {},
            variant: 'error',
          ),
        ),
      ),
    );
  }
}
