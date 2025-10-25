import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/screens/account/signup.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> splashData = [
    {
      "image":
          "https://res.cloudinary.com/dmj4ntyii/image/upload/v1761287332/pump_kidliv.png",
      "title": "PumpGo",
      "subtitle": "Order, Arrive, Refuel",
      "color": Color(0xFFED8F2F),
    },
    {
      "image":
          "https://res.cloudinary.com/dmj4ntyii/image/upload/v1761287398/gas_ujandz.png",
      "title": "FuelEase",
      "subtitle": "Skip the queue, Fuel Smarter.",
      "color": Color(0xFF3E8672),
    },
    {
      "image":
          "https://res.cloudinary.com/dmj4ntyii/image/upload/v1761287426/wait_wt81r5.png",
      "title": "QuickFuel",
      "subtitle": "Fuel without the wait",
      "color": Color(0xFFF5F5F5),
    },
  ];

  void nextPage() {
    if (_currentPage < splashData.length - 1) {
      _controller.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      context.go('/sign-up');
    }
  }

  void previousPage() {
    if (_currentPage > 0) {
      _controller.previousPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        onPageChanged: (index) => setState(() => _currentPage = index),
        itemCount: splashData.length,
        itemBuilder: (context, index) {
          final data = splashData[index];
          return Container(
            color: data['color'],
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Image.network(
                    data['image'],
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                ),
                Spacer(),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        data['title'],
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 36.0,
                          color: _currentPage == splashData.length - 1
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      Text(
                        data['subtitle'],
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              color: _currentPage == splashData.length - 1
                                  ? Colors.black
                                  : Colors.white,
                            ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: previousPage,
                      child: Text(
                        'Previous',
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              color: _currentPage == splashData.length - 1
                                  ? Colors.black
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    FilledButton(
                      onPressed: nextPage,
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        backgroundColor: Color(0xFF81B622),
                      ),
                      child: Text(
                        index == splashData.length - 1 ? 'Finish' : 'Next',
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
