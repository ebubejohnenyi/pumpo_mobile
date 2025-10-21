import 'package:flutter/material.dart';
import 'package:mobile/widget/custom_input.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFF8F8F8),
      ),
      body: Container(
        height: double.infinity,
        color: Color(0xFFF8F8F8),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              CustomInput(
                hintText: 'Search Station',
                variant: 'secondary',
                onValidate: (value) {},
                onSaved: (value) {},
                icon: Icons.search,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
