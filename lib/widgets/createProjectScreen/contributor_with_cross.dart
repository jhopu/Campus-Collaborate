import 'package:campus_collaborate/services/contributor_cross.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/themes.dart';
import '../../models/admin.dart';

class ContributorWithCross extends StatelessWidget {
  final Admin contributor;
  final double? fontSize;
  final Image prefixImage;
  final void Function() onCrossTap;
  const ContributorWithCross(
      {super.key,
      required this.contributor,
      this.fontSize,
      required this.onCrossTap,
      required this.prefixImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 150,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor:
                    Themes.getColors(ColorsValues.LIGHT_GREY_COLOR),
                radius: 12,
                child: prefixImage,
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 3,
                child: Text(
                  contributor.name,
                  style: TextStyle(
                      fontSize: fontSize ?? 15-2,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              GestureDetector(
                  onTap: onCrossTap, child: Image.asset('assets/cross.png')),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
class ContributorsWithCrossListView extends StatelessWidget {
  const ContributorsWithCrossListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContributorCrossService>(
        builder: (context, service, child) {
      if (service.contributors.isEmpty) {
        return const SizedBox(
          height: 0,
        );
      } else {
        return Wrap(
            spacing: 8,
            runSpacing: 8,
            children: service.contributors.map((contributor) {
              return ContributorWithCross(
                contributor: contributor,
                prefixImage: contributor.url == null
                    ? Image.asset(
                        'assets/circular_user.png',
                        height: 25,
                        width: 25,
                      )
                    : Image.network(
                        contributor.url!,
                        height: 25,
                        width: 25,
                      ),
                onCrossTap: () {
                  service.removeAdminFromList(contributor);
                },
              );
            }).toList());
      }
    });
  }
}
