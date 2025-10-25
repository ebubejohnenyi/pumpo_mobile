import 'package:flutter/material.dart';
import 'package:mobile/widget/transaction_card.dart';

class TransactionWrapper extends StatelessWidget {
  const TransactionWrapper({super.key, required this.date});
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            date,
            style: Theme.of(
              context,
            ).textTheme.titleSmall!.copyWith(color: Colors.grey),
          ),
        ),
        TransactionCard(
          title: 'Fund Wallet',
          subTitle: 'Received Payment',
          time: '09:29 Am',
          price: '16,900.00',
          status: true,
        ),
        TransactionCard(
          title: 'Payment for Gas',
          subTitle: 'Instant Payment',
          time: '09:29 Am',
          price: '16,900.00',
          status: false,
        ),
      ],
    );
  }
}
