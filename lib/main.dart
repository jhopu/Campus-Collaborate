import 'package:campus_collaborate/constants/themes.dart';
import 'package:campus_collaborate/services/nav_bar_services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:campus_collaborate/routes.dart' as router;
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      //options: DefaultFirebaseOptions.currentPlatform,
      );
  setUpLocator();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
  runApp(ChangeNotifierProvider(
    create: (_) => NavBarService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigationService.navigatorKey,
      onGenerateRoute: router.generateRoute,
      initialRoute: "/",
      theme: Themes.theme,
      onGenerateInitialRoutes: (String initialName) {
        return [router.generateRoute(const RouteSettings(name: "/"))];
      },
    );
  }
}
