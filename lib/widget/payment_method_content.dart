import 'package:flutter/material.dart';

class PaymentMethodContent extends StatelessWidget {
  const PaymentMethodContent({
    super.key,
    required this.title,
    required this.icon,
    this.subTitle,
    required this.isSelected,
    required this.onSelect,
  });
  final String title;
  final String? subTitle;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onSelect;

  @override
  Widget build(BuildContext context) {
    final hasSubtitle = subTitle != null && subTitle!.isNotEmpty;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFFF5F5F5) : Colors.transparent,
        border: BoxBorder.all(color: Colors.grey.shade100, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: hasSubtitle ? Text(subTitle!) : null,
        trailing: Checkbox(
          shape: CircleBorder(),
          activeColor: Colors.green,
          checkColor: Colors.white,
          value: isSelected,
          onChanged: (_) => onSelect(),
        ),
      ),
    );
  }
}
