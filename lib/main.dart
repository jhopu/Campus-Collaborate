import 'package:campus_collaborate/services/navigation_services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:campus_collaborate/routes.dart' as router;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      //options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(const MyApp());
}

final NavigationService navigationService = NavigationService();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigationService.navigatorKey,
      onGenerateRoute: router.generateRoute,
      initialRoute: "/",
      onGenerateInitialRoutes: (String initialName) {
        return [router.generateRoute(const RouteSettings(name: "/"))];
      },
    );
  }
}
