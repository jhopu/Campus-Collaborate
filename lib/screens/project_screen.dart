import 'package:campus_collaborate/models/project.dart';
import 'package:campus_collaborate/widgets/commonWidgets/app_bar.dart';
import 'package:campus_collaborate/widgets/image_collage.dart';
import 'package:flutter/material.dart';

class ProjectScreen extends StatelessWidget {
  final Project project;
  const ProjectScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: customAppBar(project.projectName, (){}),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            project.urls!=null||project.urls!.isNotEmpty?CustomImageCollage(imagesLink: project.urls!):const SizedBox(height: 0,),

          ],
        ),
      ),
    ));
  }
}
