import 'package:campus_collaborate/models/project.dart';
import 'package:campus_collaborate/widgets/commonWidgets/contributors_container.dart';
import 'package:campus_collaborate/widgets/commonWidgets/skills_container.dart';
import 'package:campus_collaborate/widgets/commonWidgets/user_circular_avtar_list.dart';
import 'package:flutter/material.dart';

import '../../constants/themes.dart';

class ProjectContainer extends StatelessWidget {
  final Project project;
  const ProjectContainer({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return project.urls == null || project.urls!.isEmpty
        ? Expanded(child: ProjectContainerWithoutImage(project: project))
        : Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Themes.getColors(ColorsValues.LIGHT_GREY_COLOR),
                borderRadius: const BorderRadius.all(Radius.circular(25)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Themes.getColors(ColorsValues.LIGHT_GREY_COLOR),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Image.network(
                        project.urls![0],
                        height: 100,
                        width: double.infinity,
                      )),
                  ProjectContainerWithoutImage(project: project)
                ],
              ),
            ),
          );
  }
}

class ProjectContainerWithoutImage extends StatelessWidget {
  final Project project;
  const ProjectContainerWithoutImage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Themes.getColors(ColorsValues.LIGHT_GREY_COLOR),
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                project.projectName,
                style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                project.admin == null ? 'Individual Project' : 'Group Project',
                style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                project.duration,
                style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              project.admin == null
                  ? ContributorContainer(
                      contributor: project.owner,
                      fontSize: 10,
                    )
                  : UserCircularAvatars(imageLinks: project.admin!)
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            project.description,
            style: const TextStyle(
                fontSize: 10, color: Colors.white, fontWeight: FontWeight.w400),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 10,
          ),
          SkillsListView(skillsList: project.skills)
        ],
      ),
    );
  }
}
