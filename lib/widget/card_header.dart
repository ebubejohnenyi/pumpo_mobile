import 'package:flutter/material.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({
    super.key,
    required this.title,
    this.distance,
    required this.status,
    this.logo,
  });

  final String title;
  final String? distance;
  final String status;
  final String? logo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minVerticalPadding: 0,
      visualDensity: VisualDensity.compact,
      leading: CircleAvatar(
        child: Image.network(
          logo != null ? logo! : '',
          fit: BoxFit.cover,
          width: 40,
          height: 40,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: distance != null
          ? Text(distance!, style: Theme.of(context).textTheme.titleSmall)
          : SizedBox(),
      trailing: status == 'Active'
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(
                status,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.green,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(
                '30 Litres',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
    );
  }
}
