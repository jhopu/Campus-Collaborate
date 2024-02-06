import 'package:campus_collaborate/constants/themes.dart';
import 'package:flutter/material.dart';

PreferredSize customAppBar(String title, Function onBackTap) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(50),
    child: AppBar(
      backgroundColor: Themes.getColors(ColorsValues.LIGHT_GREY_COLOR),
      leading: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          children: [
            GestureDetector(
              child: Image.asset(
                'assets/back_arrow.png',
              ),
              onTap: () {
                onBackTap();
              },
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
          ],
        ),
      ),
      actions: [
        GestureDetector(
            child: Icon(
          Icons.more_vert,
          color: Themes.getColors(ColorsValues.ORANGE_COLOR),
          size: 30,
        ))
      ],
      leadingWidth: double.infinity,
      elevation: 0,
    ),
  );
}
