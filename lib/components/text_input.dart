import 'package:flutter/material.dart';

import '../constans/styles/colors_const.dart';

Container buildTextFormField({
  required double height,
  required String hint,
  required TextEditingController controller,
  required TextInputType keyboardType,
  required bool obscureText,
}) {
  return Container(
    height: height * 56 / 844,
    margin: const EdgeInsets.only(top: 16),
    child: TextFormField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          color: BlogAppColors.iconPassive,
        ),
        prefixIcon: obscureText == false
            ? const Icon(Icons.email)
            : const Icon(Icons.lock),
        suffixIcon: obscureText == false
            ? null
            : IconButton(
                onPressed: () {}, icon: const Icon(Icons.remove_red_eye)),
      ),
    ),
  );
}
