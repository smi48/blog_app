import 'package:blog_app/constans/styles/text_styles_const.dart';
import 'package:flutter/material.dart';

import '../constans/styles/colors_const.dart';

enum ButtonStyleEnum { dark, light }

GestureDetector buildBigButton({
  required double screenHeight,
  required IconData icon,
  required String title,
  required ButtonStyleEnum style,
  required onPressed,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      margin: EdgeInsets.only(top: screenHeight * 16 / 844),
      decoration: BoxDecoration(
          color: style == ButtonStyleEnum.dark
              ? BlogAppColors.iconActive
              : BlogAppColors.scaffoldBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all()),
      height: screenHeight * 56 / 844,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Icon(
              icon,
              size: 25,
              color: style != ButtonStyleEnum.dark
                  ? BlogAppColors.iconActive
                  : BlogAppColors.scaffoldBg,
            ),
          ),
          Text(title,
              style: BlogAppTextStyles.buttonText.copyWith(
                  color: style == ButtonStyleEnum.dark
                      ? BlogAppColors.scaffoldBg
                      : BlogAppColors.iconActive)),
          const SizedBox(
            width: 41,
          ),
        ],
      ),
    ),
  );
}
