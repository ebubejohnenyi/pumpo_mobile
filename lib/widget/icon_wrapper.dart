import 'package:flutter/material.dart';

class IconWrapper extends StatelessWidget {
  const IconWrapper({super.key, required this.icon});
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: icon,
    );
  }
}
