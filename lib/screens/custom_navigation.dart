import 'package:flutter/material.dart';
import 'package:mobile/screens/home/home.dart';
import 'package:mobile/screens/wallet/wallet.dart';

import 'order/order.dart';

class CustomNavigation extends StatefulWidget {
  const CustomNavigation({super.key});

  @override
  State<CustomNavigation> createState() {
    return _CustomNavigationState();
  }
}

class _CustomNavigationState extends State<CustomNavigation> {
  var _selectedIndex = 0;

  final List<Widget> screens = [Home(), Order(), Wallet()];

  void _onDestinationSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.only(bottom: 10),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 100,
                spreadRadius: 1,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Theme(
              data: Theme.of(context).copyWith(
                navigationBarTheme: NavigationBarThemeData(
                  backgroundColor: Colors.white,
                  indicatorColor: Colors.transparent,
                  iconTheme: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.selected)) {
                      return const IconThemeData(color: Colors.black);
                    }
                    return const IconThemeData(color: Colors.grey);
                  }),
                  labelTextStyle: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.selected)) {
                      return const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      );
                    }
                    return const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    );
                  }),
                ),
              ),
              child: NavigationBar(
                height: 70,
                selectedIndex: _selectedIndex,
                onDestinationSelected: _onDestinationSelected,
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Icons.home_outlined),
                    selectedIcon: Icon(Icons.home_outlined),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.receipt_long_outlined),
                    selectedIcon: Icon(Icons.receipt_long_outlined),
                    label: 'Order',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.account_balance_wallet_outlined),
                    selectedIcon: Icon(Icons.account_balance_wallet_outlined),
                    label: 'Wallet',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
