import 'package:flutter/material.dart';

import '../../widget/settings_content.dart';

class Languages extends StatelessWidget {
  const Languages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Languages',
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
              SettingsContent(title: 'English', onTap: () {}),
              SettingsContent(title: 'Igbo', onTap: () {}),
              SettingsContent(title: 'Yoruba', onTap: () {}),
              SettingsContent(title: 'Hausa', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
