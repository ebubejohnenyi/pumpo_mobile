import 'package:flutter/material.dart';

class Assurance extends StatelessWidget {
  const Assurance({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0x33008000),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          Icon(Icons.shield_moon),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          Expanded(
            child: Text(
              'We adhere entirely to the data security standards of the payment card industry',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
