import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.variant = 'primary',
    required this.onClick,
  });

  final String title;
  final String? variant;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: variant == 'primary'
            ? Color(0xFF81B622)
            : Color(0xFFC11000),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: onClick,
      child: Text(title),
    );
  }
}
