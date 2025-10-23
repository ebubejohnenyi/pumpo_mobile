import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Map Showing Here',
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
