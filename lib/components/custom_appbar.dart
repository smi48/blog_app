import 'package:flutter/material.dart';

import 'package:blog_app/constans/styles/colors_const.dart';

class CustomAppbar extends AppBar {
  CustomAppbar({
    Key? key,
    required this.appbarTitle,
  }) : super(key: key);

  final Text appbarTitle;

  Widget build(BuildContext context) {
    return PreferredSize(
      child: Container(
          decoration:
              const BoxDecoration(color: BlogAppColors.appBarBg, boxShadow: [
            BoxShadow(
              color: Color(0xFF000000),
              offset: Offset(0, 2.0),
              blurRadius: 8.0,
            ),
          ]),
          child: AppBar(
            title: appbarTitle,
            titleTextStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: BlogAppColors.iconActive),
            backgroundColor: BlogAppColors.appBarBg,
          )),
      preferredSize: Size.fromHeight(
        (MediaQuery.of(context).size.height * 91 / 844),
      ),
    );
  }
}
