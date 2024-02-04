
import 'package:campus_collaborate/constants/routing_constants.dart';
import 'package:campus_collaborate/models/user_info.dart';
import 'package:campus_collaborate/screens/profile_screen.dart';
import 'package:campus_collaborate/screens/splash_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.splashScreen:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case Routes.profileScreen:
      final userInfo = settings.arguments as UserInfo;
      return MaterialPageRoute(builder: (context)=>ProfileScreen(userInfo: userInfo));
    default:
      return MaterialPageRoute(builder: (context) => const ErrorScreen());
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Invalid Screen'),
    );
  }
}
