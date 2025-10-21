import 'package:flutter/material.dart';

import '../../widget/settings_content.dart';

class CustomerSupport extends StatelessWidget {
  const CustomerSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Customer Support',
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
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              SettingsContent(
                title: 'Gmail',
                prefixImage: 'assets/png/gmail.png',
                suffixIcon: Icons.arrow_forward_ios,
                onTap: () {},
              ),
              SettingsContent(
                title: 'Instagram',
                prefixImage: 'assets/png/instagram.png',
                suffixIcon: Icons.arrow_forward_ios,
                onTap: () {},
              ),
              SettingsContent(
                title: 'Facebook',
                prefixImage: 'assets/png/facebook.png',
                suffixIcon: Icons.arrow_forward_ios,
                onTap: () {},
              ),
              SettingsContent(
                title: 'Twitter',
                prefixImage: 'assets/png/twitter.png',
                suffixIcon: Icons.arrow_forward_ios,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
