import 'package:flutter/material.dart';

class PriceWrapper extends StatelessWidget {
  const PriceWrapper({
    super.key,
    required this.title,
    this.price,
    this.unit,
    this.wallet,
    this.total,
  });

  final String title;
  final String? price;
  final String? unit;
  final String? wallet;
  final String? total;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Colors.grey,
            fontWeight: FontWeight.w700,
            fontSize: 11.0,
          ),
        ),
        price != null && unit != null
            ? Text(
                '₦$price/$unit',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              )
            : SizedBox(),
        wallet != null
            ? Text(
                wallet!,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              )
            : SizedBox(),
        total != null
            ? Text(
                '₦$total!',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF008000),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
