import 'package:campus_collaborate/screens/login_screen.dart';
import 'package:campus_collaborate/services/navigation_services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:campus_collaborate/routes.dart' as router;
import 'package:flutter/services.dart';

import 'chats/screens/dm_chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      //options: DefaultFirebaseOptions.currentPlatform,
      );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
  runApp(MyApp());
}

final NavigationService navigationService = NavigationService();

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       navigatorKey: navigationService.navigatorKey,
//       onGenerateRoute: router.generateRoute,
//       initialRoute: "/",
//       onGenerateInitialRoutes: (String initialName) {
//         return [router.generateRoute(const RouteSettings(name: "/"))];
//       },
//     );
//   }
// }

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,

      home: LoginScreen(),
    );
  }
}
