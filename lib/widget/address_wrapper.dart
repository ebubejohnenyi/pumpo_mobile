import 'package:flutter/material.dart';

class AddressWrapper extends StatelessWidget {
  const AddressWrapper({
    super.key,
    required this.label,
    required this.address,
    required this.icon,
  });

  final String address;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.green),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Text(
                address,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(label, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
