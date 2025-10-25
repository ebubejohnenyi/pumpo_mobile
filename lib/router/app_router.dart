import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/model/station_model.dart';
import 'package:mobile/screens/pre_order/pre_order.dart';
import 'package:mobile/screens/settings/customer_support.dart';
import 'package:mobile/screens/settings/languages.dart';
import 'package:mobile/screens/settings/manage_card.dart';
import 'package:mobile/screens/settings/profile_details.dart';
import 'package:mobile/screens/settings/security.dart';
import 'package:mobile/screens/wallet/add_money.dart';
import 'package:mobile/screens/wallet/transaction.dart';
import '../screens/account/login.dart';
import '../screens/account/signup.dart';
import '../screens/custom_navigation.dart';
import '../screens/forgotten_password/forgotten_password.dart';
import '../screens/forgotten_password/set_new_password.dart';
import '../screens/forgotten_password/verify_code.dart';
import '../screens/home/home.dart';
import '../screens/notification/notification_screen.dart';
import '../screens/order/order.dart';
import '../screens/receipt/receipt.dart';
import '../screens/search/search.dart';
import '../screens/settings/settings.dart';
import '../screens/splash/splash.dart';
import '../screens/wallet/wallet.dart';
import '../widget/loading_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/loading',
    routes: <RouteBase>[
      ShellRoute(
        builder: (context, state, child) => CustomNavigation(child: child),
        routes: [
          GoRoute(path: '/home', builder: (_, _) => Home()),
          GoRoute(path: '/order', builder: (_, _) => Order()),
          GoRoute(path: '/wallet', builder: (_, _) => Wallet()),
        ],
      ),
      GoRoute(path: '/receipt', builder: (_, _) => Receipt()),
      GoRoute(path: '/loading', builder: (_, _) => LoadingScreen()),
      GoRoute(path: '/splash', builder: (_, _) => Splash()),
      GoRoute(path: '/login', builder: (_, _) => Login()),
      GoRoute(
        path: '/forgotten-password',
        builder: (_, _) => ForgottenPassword(),
      ),
      GoRoute(path: '/verify-code', builder: (_, _) => VerifyCode()),
      GoRoute(path: '/set-new-password', builder: (_, _) => SetNewPassword()),
      GoRoute(path: '/sign-up', builder: (_, _) => SignUp()),
      GoRoute(
        path: '/pre-order',
        builder: (context, state) {
          final station = state.extra as StationModel;
          return PreOrder(station: station);
        },
      ),
      GoRoute(path: '/search', builder: (_, _) => Search()),
      GoRoute(path: '/notification', builder: (_, _) => NotificationScreen()),
      GoRoute(path: '/settings', builder: (_, _) => Settings()),
      GoRoute(path: '/profile-detail', builder: (_, _) => ProfileDetails()),
      GoRoute(path: '/customer-support', builder: (_, _) => CustomerSupport()),
      GoRoute(path: '/language', builder: (_, _) => Languages()),
      GoRoute(path: '/security', builder: (_, _) => Security()),
      GoRoute(path: '/manage-card', builder: (_, _) => ManageCard()),
      GoRoute(path: '/add-money', builder: (_, _) => AddMoney()),
      GoRoute(path: '/transaction', builder: (_, _) => Transaction()),
      GoRoute(
        path: '/error',
        builder: (_, __) =>
            const Scaffold(body: Center(child: Text('Something went wrong'))),
      ),
    ],
  );
}
