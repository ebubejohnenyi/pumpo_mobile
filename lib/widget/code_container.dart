import 'package:flutter/material.dart';

import 'code_wrapper.dart';

class CodeContainer extends StatelessWidget {
  const CodeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Share this code \nwith your attendant',
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CodeWrapper(code: '9'),
            CodeWrapper(code: '6'),
            CodeWrapper(code: '6'),
            CodeWrapper(code: '0'),
          ],
        ),
      ],
    );
  }
}
