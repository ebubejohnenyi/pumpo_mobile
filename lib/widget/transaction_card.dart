import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.time,
    required this.price,
    this.status,
  });

  final String title;
  final String subTitle;
  final String time;
  final String price;
  final bool? status;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: CircleAvatar(),
          title: Text(title),
          subtitle: Text(subTitle),
          trailing: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                time,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(color: Colors.grey),
              ),
              Text(
                '₦$price',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: status! ? Color(0xFF008000) : Colors.red,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Divider(color: Colors.grey.shade200, thickness: 1.5),
        ),
      ],
    );
  }
}
