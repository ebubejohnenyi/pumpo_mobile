import 'package:flutter/material.dart';
import 'package:mobile/widget/custom_button.dart';

class ManageCard extends StatelessWidget {
  const ManageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Manage Card',
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFF8F8F8),
      ),
      body: Container(
        color: Color(0xFFF8F8F8),
        height: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/png/money.png',
                        fit: BoxFit.cover,
                        width: 40,
                        height: 40,
                      ),

                      Text(
                        '1234***12****05',
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.delete_forever_outlined,
                          color: Color(0xFFC10000),
                        ),
                        Text(
                          'Remove',
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(
                                color: Color(0xFFC10000),
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              CustomButton(title: 'Add a new card', onClick: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
