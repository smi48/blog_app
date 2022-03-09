import 'package:flutter/material.dart';

import '../constans/styles/colors_const.dart';

Container buildTextFormField({required double height, required String hint}) {
  return Container(
    height: height * 56 / 844,
    margin: const EdgeInsets.only(top: 16),
    child: TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          color: BlogAppColors.iconPassive,
        ),
        prefixIcon: const Icon(Icons.email),
        suffixIcon: IconButton(
            onPressed: () {}, icon: const Icon(Icons.remove_red_eye)),
      ),
    ),
  );
}
