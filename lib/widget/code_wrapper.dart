import 'package:flutter/material.dart';

class CodeWrapper extends StatelessWidget {
  const CodeWrapper({super.key, required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: Color(0x1A008000),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          code,
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
