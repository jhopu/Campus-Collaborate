import 'package:campus_collaborate/constants/themes.dart';
import 'package:flutter/material.dart';

PreferredSize customAppBar(String title, Function onBackTap) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(50),
    child: AppBar(
      backgroundColor: Themes.getColors(ColorsValues.LIGHT_GREY_COLOR),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
      ),
      centerTitle: false,
      leading: GestureDetector(
        child: SizedBox(
          height: 21.05,
          width: 12,
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Themes.getColors(ColorsValues.ORANGE_COLOR),
            size: 27,
          ),
        ),
        onTap: () {
          onBackTap();
        },
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              child: Icon(Icons.more_vert, color: Themes.getColors(ColorsValues.ORANGE_COLOR), size: 30,)
            ),
          ],
        )
      ],
      leadingWidth: 20,
      elevation: 0,
    ),
  );
}
