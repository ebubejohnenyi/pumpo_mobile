import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WalletBalanceCard extends StatefulWidget {
  const WalletBalanceCard({super.key, required this.balance});

  final String balance;

  @override
  State<StatefulWidget> createState() {
    return _WalletBalanceCardState();
  }
}

class _WalletBalanceCardState extends State<WalletBalanceCard> {
  final textToCopy = '9112349712';
  var isCopied = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 0,
        color: Color(0xFFF5F5F5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Wallet',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(color: Colors.grey),
              ),
              Text(
                '₦${widget.balance}',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Fund wallet with your \n virtual account number',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                  Expanded(
                    child: Card(
                      color: Color(0xFF81B622),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 5.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Paystack Titan',
                                  style: Theme.of(context).textTheme.titleSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontSize: 11.0,
                                      ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await Clipboard.setData(
                                      ClipboardData(text: textToCopy),
                                    );
                                    setState(() {
                                      isCopied = true;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.copy_all_outlined,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                      Text(
                                        isCopied ? 'Copied' : 'Copy',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              textToCopy,
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
