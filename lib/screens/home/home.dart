import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/data/bloc/stations/station_bloc.dart';
import 'package:mobile/screens/pre_order/pre_order.dart';
import 'package:mobile/screens/search/search.dart';
import 'package:mobile/screens/settings/settings.dart';
import 'package:mobile/widget/address_wrapper.dart';
import 'package:mobile/widget/card_header.dart';
import 'package:mobile/widget/icon_wrapper.dart';
import 'package:mobile/widget/price_wrapper.dart';
import 'package:mobile/screens/notification/notification_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F8F8),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Location',
              style: Theme.of(context).textTheme.titleSmall,
            ),

            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      'Current Address',
                      style: TextTheme.of(context).titleMedium!.copyWith(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.keyboard_arrow_down_outlined),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconWrapper(
            icon: IconButton(
              onPressed: () {
                context.push('/search');
              },
              icon: Icon(Icons.search_outlined),
            ),
          ),
          SizedBox(width: 10),
          IconWrapper(
            icon: IconButton(
              onPressed: () {
                context.push('/notification');
              },
              icon: Icon(Icons.notifications_none_outlined),
            ),
          ),
          SizedBox(width: 10),
          IconWrapper(
            icon: IconButton(
              onPressed: () {
                context.push('/settings');
              },
              icon: Icon(Icons.settings),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: BlocBuilder<StationBloc, StationState>(
        builder: (context, state) {
          if (state is StationLoading) {
            return CircularProgressIndicator();
          } else if (state is StationLoaded) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10),
              itemCount: state.stations.length,
              itemBuilder: (ctx, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Nearby Stations',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }

                final station = state.stations[index - 1];
                return GestureDetector(
                  onTap: () {
                    context.push('/pre-order', extra: station);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Card(
                      elevation: 0,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            CardHeader(
                              logo: station.logo,
                              title: station.name,
                              distance: station.distance,
                              status: station.status,
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
                                    price: station.petrolPrice,
                                    unit: 'liter',
                                  ),
                                  PriceWrapper(
                                    title: 'Diesel',
                                    price: station.dieselPrice,
                                    unit: 'liter',
                                  ),
                                  PriceWrapper(
                                    title: 'Gas',
                                    price: station.gasPrice,
                                    unit: 'kg',
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
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            AddressWrapper(
                              label: 'Filling Stattion',
                              address: station.stationAddress,
                              icon: Icons.my_location,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            AddressWrapper(
                              label: 'You',
                              address: station.userAddress,
                              icon: Icons.location_pin,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return SizedBox();
        },
      ),

      // SingleChildScrollView(
      //   padding: EdgeInsets.symmetric(horizontal: 10),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text(
      //         'Near by Stations',
      //         style: Theme.of(
      //           context,
      //         ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600),
      //       ),
      //       SizedBox(height: MediaQuery.of(context).size.height * 0.01),
      //       Padding(
      //         padding: EdgeInsets.only(bottom: 20.0),
      //         child: Card(
      //           elevation: 0,
      //           color: Colors.white,
      //           child: Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 10),
      //             child: Column(
      //               children: [
      //                 CardHeader(
      //                   title: 'Oando Ltd',
      //                   distance: '12 km away',
      //                   status: 'Active',
      //                 ),
      //                 Divider(
      //                   color: Colors.grey[100],
      //                   thickness: 1.5,
      //                   height: 0,
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.symmetric(vertical: 20.0),
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       PriceWrapper(
      //                         title: 'Petrol',
      //                         price: '630',
      //                         unit: 'liter',
      //                       ),
      //                       PriceWrapper(
      //                         title: 'Diesel',
      //                         price: '950',
      //                         unit: 'liter',
      //                       ),
      //                       PriceWrapper(
      //                         title: 'Gas',
      //                         price: '330',
      //                         unit: 'kg',
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 Divider(
      //                   color: Colors.grey[100],
      //                   thickness: 1.5,
      //                   height: 0,
      //                 ),
      //                 SizedBox(
      //                   height: MediaQuery.of(context).size.height * 0.02,
      //                 ),
      //                 AddressWrapper(
      //                   label: 'Filling Stattion',
      //                   address: 'Sabo yaba round about, off iwaya road.',
      //                   icon: Icons.my_location,
      //                 ),
      //                 SizedBox(
      //                   height: MediaQuery.of(context).size.height * 0.01,
      //                 ),
      //                 AddressWrapper(
      //                   label: 'You',
      //                   address: '88 Ozumba Mbadiwe Lekki Road',
      //                   icon: Icons.location_pin,
      //                 ),
      //                 SizedBox(
      //                   height: MediaQuery.of(context).size.height * 0.02,
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.only(bottom: 10.0),
      //         child: Card(
      //           elevation: 0,
      //           color: Colors.white,
      //           child: Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 10),
      //             child: Column(
      //               children: [
      //                 CardHeader(
      //                   title: 'Oando Ltd',
      //                   distance: '12 km away',
      //                   status: 'Active',
      //                 ),
      //                 Divider(
      //                   color: Colors.grey[100],
      //                   thickness: 1.5,
      //                   height: 0,
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.symmetric(vertical: 20.0),
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       PriceWrapper(
      //                         title: 'Petrol',
      //                         price: '630',
      //                         unit: 'liter',
      //                       ),
      //                       PriceWrapper(
      //                         title: 'Diesel',
      //                         price: '950',
      //                         unit: 'liter',
      //                       ),
      //                       PriceWrapper(
      //                         title: 'Gas',
      //                         price: '330',
      //                         unit: 'kg',
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 Divider(
      //                   color: Colors.grey[100],
      //                   thickness: 1.5,
      //                   height: 0,
      //                 ),
      //                 SizedBox(
      //                   height: MediaQuery.of(context).size.height * 0.02,
      //                 ),
      //                 AddressWrapper(
      //                   label: 'Filling Stattion',
      //                   address: 'Sabo yaba round about, off iwaya road.',
      //                   icon: Icons.my_location,
      //                 ),
      //                 SizedBox(
      //                   height: MediaQuery.of(context).size.height * 0.01,
      //                 ),
      //                 AddressWrapper(
      //                   label: 'You',
      //                   address: '88 Ozumba Mbadiwe Lekki Road',
      //                   icon: Icons.location_pin,
      //                 ),
      //                 SizedBox(
      //                   height: MediaQuery.of(context).size.height * 0.02,
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
