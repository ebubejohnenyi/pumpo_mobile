import 'package:flutter/material.dart';
import 'package:mobile/widget/icon_wrapper.dart';
import 'package:mobile/widget/no_nofication.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification',
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFF8F8F8),
      ),
      body: Container(
        height: double.infinity,
        color: Color(0xFFF8F8F8),
        child: Center(child: NoNotification()),
        // ListView.builder(
        //   itemCount: 2,
        //   itemBuilder: (ctx, index) {
        //     return ListTile(
        //       leading: Icon(Icons.notifications_none_outlined),
        //       title: Text(
        //         'This is to inform you that version 2.6v of the app is available',
        //       ),
        //       trailing: Text(
        //         '12:07 PM',
        //         style: Theme.of(
        //           context,
        //         ).textTheme.titleSmall!.copyWith(color: Colors.grey.shade400),
        //       ),
        //     );
        //   },
        // ),
      ),
    );
  }
}
