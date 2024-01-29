import 'package:campus_collaborate/constants/routing_constants.dart';
import 'package:campus_collaborate/screens/splash_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.splashScreen:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
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
