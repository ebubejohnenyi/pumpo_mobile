import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/screens/order/order.dart';
import 'package:mobile/widget/custom_button.dart';
import 'package:mobile/widget/receipt_content.dart';

class Receipt extends StatelessWidget {
  const Receipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(50),
              ),
              padding: EdgeInsets.all(30),
              child: Icon(Icons.check_circle, color: Colors.green, size: 40),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              'Payment Successful',
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Successfully Paid'),
                SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                Text(
                  'N783,907,900',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Transaction Details',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  ReceiptContent(title: 'Transaction ID', value: '1234567890'),
                  ReceiptContent(title: 'Date', value: '12:17PM 25th Sep 2025'),
                  ReceiptContent(title: 'Transaction Tyoe', value: 'Credit'),
                  ReceiptContent(title: 'Tax', value: 'N200'),
                  ReceiptContent(title: 'Total', value: 'N12,000'),
                  ReceiptContent(title: 'Status', value: 'Successful'),
                ],
              ),
            ),
            Spacer(),
            CustomButton(
              title: 'Go to Orders',
              onClick: () {
                context.go('/order');
              },
            ),
          ],
        ),
      ),
    );
  }
}
