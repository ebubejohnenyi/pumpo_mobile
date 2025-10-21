import 'package:flutter/material.dart';
import 'package:mobile/widget/code_container.dart';
import 'package:mobile/widget/code_wrapper.dart';
import 'package:mobile/widget/icon_wrapper.dart';

import '../../widget/address_wrapper.dart';
import '../../widget/card_header.dart';
import '../../widget/price_wrapper.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Orders',
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFFF8F8F8),
          bottom: TabBar(
            indicatorColor: Color(0xFF81B622),
            indicatorWeight: 4,
            labelColor: Color(0xFF81B622),
            unselectedLabelColor: Colors.grey,
            labelStyle: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600),
            tabs: const [
              Tab(text: 'Pre Orders'),
              Tab(text: 'Completed Orders'),
              Tab(text: 'Cancelled Orders'),
            ],
          ),
        ),
        body: Container(
          color: Color(0xFFF8F8F8),
          child: TabBarView(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Card(
                        elevation: 0,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              CardHeader(
                                title: 'Oando Ltd',
                                status: '30 Litres',
                              ),
                              Divider(
                                color: Colors.grey[100],
                                thickness: 1.5,
                                height: 0,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20.0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    PriceWrapper(
                                      title: 'Petrol',
                                      price: '630',
                                      unit: 'liter',
                                    ),
                                    PriceWrapper(
                                      title: 'Payment Method',
                                      wallet: 'Wallet',
                                    ),
                                    PriceWrapper(
                                      title: 'Total',
                                      total: '630,973.00',
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.grey[100],
                                thickness: 1.5,
                                height: 0,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              AddressWrapper(
                                label: 'Filling Stattion',
                                address:
                                    'Sabo yaba round about, off iwaya road.',
                                icon: Icons.my_location,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              CodeContainer(),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    IconWrapper(
                      icon: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.local_gas_station, size: 30),
                      ),
                    ),
                    Text('No Completed orders'),
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    IconWrapper(
                      icon: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.local_gas_station, size: 30),
                      ),
                    ),
                    Text('No Cancelled orders'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
