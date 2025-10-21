import 'package:flutter/material.dart';

import 'icon_wrapper.dart';

class NoNotification extends StatelessWidget {
  const NoNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconWrapper(
          icon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.notifications_off_outlined, size: 33),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Text('No Notification'),
      ],
    );
  }
}
