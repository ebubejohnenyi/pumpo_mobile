import 'package:flutter/material.dart';

class WalletContentHeader extends StatelessWidget {
  const WalletContentHeader({
    super.key,
    required this.title,
    this.trailingText,
  });

  final String title;
  final String? trailingText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF5F5F5),
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          GestureDetector(
            onTap: () {},
            child: trailingText != null
                ? Text(
                    trailingText!,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  )
                : SizedBox(),
          ),
        ],
      ),
    );
  }
}
