import 'package:flutter/material.dart';

class UserCircularAvatars extends StatelessWidget {
  final List<String> imageLinks;
  const UserCircularAvatars({super.key, required this.imageLinks});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 70,
      child: Stack(
          children: List.generate(imageLinks.length, (index) {
        return Positioned(
            left: index * 15,
            child: CircleAvatar(
              backgroundImage: NetworkImage(imageLinks[index]),
              radius: 15,
            ));
      })),
    );
  }
}
