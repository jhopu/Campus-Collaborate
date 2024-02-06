import 'package:flutter/material.dart';

import '../../constants/themes.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final Widget? suffix;
  const CommonTextField(
      {super.key,
      required this.textEditingController,
      required this.hintText,
      this.suffix});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
        color: Themes.getColors(ColorsValues.LIGHT_GREY_COLOR),
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            hintText: hintText,
            border: InputBorder.none,
            hintStyle: TextStyle(
                color: Themes.getColors(ColorsValues.LIGHT_TEXT_COLOR),
                fontSize: 13,
                fontWeight: FontWeight.w400),
            suffixIcon: suffix),
        style: const TextStyle(color: Colors.white, fontSize: 13),
        cursorColor: Themes.getColors(ColorsValues.ORANGE_COLOR),
      ),
    );
  }
}
