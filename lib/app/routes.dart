import 'package:flutter/widgets.dart';
import 'package:topline_mobile_app/ui/pages/home/home_view.dart';
import 'package:topline_mobile_app/ui/pages/login/login_view.dart';
import 'package:topline_mobile_app/ui/pages/payment/payment_view.dart';
import 'package:topline_mobile_app/ui/pages/profile/profile_view.dart';
import 'package:topline_mobile_app/ui/pages/register/register_view.dart';
import 'package:topline_mobile_app/ui/pages/splash/splash_view.dart';
import 'package:topline_mobile_app/ui/pages/top_up/top_up_view.dart';
import 'package:topline_mobile_app/ui/pages/transactions/transactions_view.dart';

class AppRoutes {
  //===================
  // Register new route here
  //===================
  static const String mainRoute = '/';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String topUpRoute = '/top-up'; 
  static const String paymentRoute = '/payment';
  static const String profileRoute = '/profile';
  static const String registerRoute = '/register';
  static const String transactionsRoute = '/transactions';
}

class AppPages {
  //===================
  // Register new page here
  //===================
  static Map<String, Widget Function(BuildContext)> pages = {
    AppRoutes.homeRoute: (context) => const HomeView(),
    AppRoutes.mainRoute: (context) => const SplashView(),
    AppRoutes.loginRoute: (context) => const LoginView(),
    AppRoutes.profileRoute: (context) => const ProfileView(), 
    AppRoutes.registerRoute: (context) => const RegisterView(),
    AppRoutes.transactionsRoute: (context) => const TransactionsView(),
    AppRoutes.topUpRoute: (context) => const TopUpView(),
    AppRoutes.paymentRoute: (context) => const PaymentView(),
  };
}
