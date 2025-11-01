import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/widget/transaction_wapper.dart';
import 'package:mobile/widget/wallet_balance_card.dart';
import 'package:mobile/widget/wallet_content_header.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    String linkCard = 'Link Card';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wallet',
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        shape: Border(
          bottom: BorderSide(color: Colors.grey.shade100, width: 1),
        ),
      ),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WalletBalanceCard(balance: '169,500.00'),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              WalletContentHeader(title: 'Manage Card'),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(Icons.link),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          Text(linkCard),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.push('/add-money');
                      },
                      child: Row(
                        children: [
                          Icon(Icons.add),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          Text('Add Money'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              WalletContentHeader(
                title: 'Recent Activity',
                trailingText: 'See all',
              ),
              TransactionWrapper(date: 'Today'),
            ],
          ),
        ),
      ),
    );
  }
}
