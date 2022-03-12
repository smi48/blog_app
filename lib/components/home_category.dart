import 'package:flutter/material.dart';

import '../constans/styles/colors_const.dart';

Column buildCategory(double screenHeight, double screenWidth, int index,
    String title, String image) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: BlogAppColors.iconPassive,
          borderRadius: BorderRadius.circular(16),
        ),
        height: screenHeight * 91 / 844,
        width: screenWidth * 164 / 390,
      ),
      Padding(
          padding: const EdgeInsets.only(top: 8, left: 5), child: Text(title)),
    ],
  );
}
