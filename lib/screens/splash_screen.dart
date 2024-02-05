import 'package:campus_collaborate/models/project.dart';
import 'package:campus_collaborate/sample_data.dart';
import 'package:campus_collaborate/screens/home_screen.dart';
import 'package:campus_collaborate/screens/profile_screen.dart';
import 'package:campus_collaborate/screens/project_screen.dart';
import 'package:flutter/material.dart';

import '../models/user_info.dart';
import 'other_user_profile_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ProjectScreen(project: Project.fromJson(sampleProject),)
    );
  }
}
