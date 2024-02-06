
import 'package:campus_collaborate/constants/themes.dart';
import 'package:campus_collaborate/services/contributor_cross.dart';
import 'package:campus_collaborate/services/docs_and_images.dart';
import 'package:campus_collaborate/services/drop_down_services.dart';
import 'package:campus_collaborate/services/nav_bar_services.dart';
import 'package:campus_collaborate/services/toggle_button_services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:campus_collaborate/routes.dart' as router;
import 'package:provider/provider.dart';

import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      //options: DefaultFirebaseOptions.currentPlatform,
      );
  setUpLocator();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>NavBarService()),
    ChangeNotifierProvider(create: (_)=>DropDownServices()),
    ChangeNotifierProvider(create: (_)=>ProjectStatusToggleButtonService()),
    ChangeNotifierProvider(create: (_)=>ProjectTypeToggleButtonService()),
    ChangeNotifierProvider(create: (_)=>ContributorCrossService()),
    ChangeNotifierProvider(create: (_)=>DocsStateService()),
    ChangeNotifierProvider(create: (_)=>ProjectImageStateService())
  ],
    child: const MyApp(),
  )
  );
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
