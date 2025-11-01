import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/widget/assurance.dart';
import 'package:mobile/widget/bottom_modal.dart';
import 'package:mobile/widget/custom_button.dart';
import 'package:mobile/widget/map_screen.dart';
import 'package:mobile/widget/payment_method_content.dart';
import 'package:mobile/widget/track_successful_content.dart';

import '../../model/station_model.dart';
import '../../widget/address_wrapper.dart';
import '../../widget/card_header.dart';
import '../../widget/price_wrapper.dart';
import '../../widget/receipt_content.dart';

class PreOrder extends StatefulWidget {
  const PreOrder({super.key, required this.station});

  final StationModel station;

  @override
  State<PreOrder> createState() {
    return _PreOrderState();
  }
}

class _PreOrderState extends State<PreOrder> {
  var isVisible = true;
  String selectedFuel = 'Petrol';
  String? selectedPrice;
  String selectedMethod = '';

  late final Map<String, dynamic> fuelTypes;

  @override
  void initState() {
    super.initState();

    fuelTypes = {
      'Petrol': widget.station.petrolPrice,
      'Diesel': widget.station.dieselPrice,
      'Gas': widget.station.gasPrice,
    };

    selectedPrice = fuelTypes[selectedFuel];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Positioned.fill(child: MapScreen()),
          Positioned(
            bottom: 20,
            left: 10,
            right: 10,
            child: Column(
              children: [
                Card(
                  elevation: 0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        CardHeader(
                          logo: widget.station.logo,
                          title: widget.station.name,
                          distance: widget.station.distance,
                          status: isVisible ? 'Close' : 'View',
                          onTapStatus: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                        ),
                        if (isVisible)
                          Divider(
                            color: Colors.grey[100],
                            thickness: 1.5,
                            height: 0,
                          ),
                        if (isVisible)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                PriceWrapper(
                                  title: 'Petrol',
                                  price: widget.station.petrolPrice,
                                  unit: 'liter',
                                ),
                                PriceWrapper(
                                  title: 'Diesel',
                                  price: widget.station.dieselPrice,
                                  unit: 'liter',
                                ),
                                PriceWrapper(
                                  title: 'Gas',
                                  price: widget.station.gasPrice,
                                  unit: 'kg',
                                ),
                              ],
                            ),
                          ),
                        if (isVisible)
                          Divider(
                            color: Colors.grey[100],
                            thickness: 1.5,
                            height: 0,
                          ),
                        if (isVisible)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF5F5F5),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: selectedFuel,
                                      dropdownColor: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      padding: EdgeInsets.zero,
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                      ),
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleMedium,
                                      items: fuelTypes.entries.map((fuel) {
                                        return DropdownMenuItem<String>(
                                          value: fuel.key,
                                          child: Text(fuel.key),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedFuel = value!;
                                          selectedPrice = fuelTypes[value];
                                          print(fuelTypes[value]);
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Icon(Icons.remove, size: 30),
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.08,
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          '₦${selectedPrice ?? '--'}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Text(
                                          'Litre: 1',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                color: Colors.grey[800],
                                              ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.08,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Icon(Icons.add, size: 30),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Card(
                  elevation: 0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        AddressWrapper(
                          label: 'Open 9:00AM - 22:00PM',
                          address:
                              '${widget.station.name} - ${widget.station.stationAddress}',
                          icon: Icons.my_location,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        AddressWrapper(
                          label: 'Current Location',
                          address: widget.station.userAddress,
                          icon: Icons.location_pin,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CustomButton(
                                variant: 'tertiary',
                                title: 'Pre Order',
                                icon: Icons.shopping_cart_outlined,
                                iconColor: Colors.grey,
                                titleStyle: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: Colors.grey),
                                onClick: () {},
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            Expanded(
                              child: CustomButton(
                                icon: Icons.receipt_outlined,
                                title: 'Order Now',
                                onClick: () => {
                                  BottomModal.show(
                                    context: context,
                                    child: FractionallySizedBox(
                                      heightFactor: 0.73,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0,
                                          vertical: 20,
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Choose Payment Method',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Icon(
                                                    Icons.close,
                                                    size: 25,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.height *
                                                  0.02,
                                            ),
                                            ReceiptContent(
                                              title: 'Sub Total',
                                              value: '₦10,000',
                                            ),
                                            ReceiptContent(
                                              title: 'Service Fee',
                                              value: '₦200',
                                            ),
                                            ReceiptContent(
                                              title: 'Total',
                                              value: '₦12,000',
                                            ),
                                            SizedBox(
                                              height:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.height *
                                                  0.02,
                                            ),
                                            PaymentMethodContent(
                                              title: 'Transfer',
                                              icon:
                                                  Icons.network_check_outlined,
                                              isSelected:
                                                  selectedMethod == 'Transfer',
                                              onSelect: () {
                                                setState(
                                                  () => selectedMethod =
                                                      'Transfer',
                                                );
                                              },
                                            ),
                                            SizedBox(
                                              height:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.height *
                                                  0.02,
                                            ),
                                            PaymentMethodContent(
                                              title: 'Wallet',
                                              icon: Icons
                                                  .account_balance_wallet_outlined,
                                              isSelected:
                                                  selectedMethod == 'Wallet',
                                              onSelect: () {
                                                setState(
                                                  () =>
                                                      selectedMethod = 'Wallet',
                                                );
                                              },
                                            ),
                                            SizedBox(
                                              height:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.height *
                                                  0.03,
                                            ),
                                            Spacer(),
                                            Assurance(),
                                            SizedBox(
                                              height:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.height *
                                                  0.03,
                                            ),
                                            CustomButton(
                                              title: 'Continue',
                                              onClick: () {
                                                context.pop();
                                                BottomModal.show(
                                                  context: context,
                                                  child: FractionallySizedBox(
                                                    heightFactor: 0.9,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 15.0,
                                                            vertical: 20,
                                                          ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child:
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    context
                                                                        .pop();
                                                                  },
                                                                  child: Icon(
                                                                    Icons.close,
                                                                    size: 25,
                                                                  ),
                                                                ),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                MediaQuery.of(
                                                                  context,
                                                                ).size.height *
                                                                0.02,
                                                          ),
                                                          Text(
                                                            'Meet your attendant and say "6001"',
                                                            style: Theme.of(context)
                                                                .textTheme
                                                                .titleLarge!
                                                                .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                MediaQuery.of(
                                                                  context,
                                                                ).size.height *
                                                                0.01,
                                                          ),
                                                          Text(
                                                            "Here's how it works",
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                MediaQuery.of(
                                                                  context,
                                                                ).size.height *
                                                                0.02,
                                                          ),
                                                          TrackSuccessfulContent(
                                                            orderNumber: '1',
                                                            title:
                                                                'Drive to the station',
                                                            image:
                                                                'assets/png/roadmap.png',
                                                          ),
                                                          TrackSuccessfulContent(
                                                            orderNumber: '2',
                                                            title:
                                                                'Arrives at station',
                                                            image:
                                                                'assets/png/map.png',
                                                          ),
                                                          TrackSuccessfulContent(
                                                            orderNumber: '3',
                                                            title:
                                                                'Meet you attendant and say your PIN',
                                                            image:
                                                                'assets/png/megaphone.png',
                                                          ),
                                                          TrackSuccessfulContent(
                                                            orderNumber: '4',
                                                            title:
                                                                'Receive your order',
                                                            image:
                                                                'assets/png/fuel.png',
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                MediaQuery.of(
                                                                  context,
                                                                ).size.height *
                                                                0.02,
                                                          ),
                                                          CustomButton(
                                                            title: 'Okay',
                                                            onClick: () {
                                                              context.pop();
                                                              context.go(
                                                                '/order',
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
