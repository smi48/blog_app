import 'package:blog_app/screens/tabs/artical_detail_page.dart';
import 'package:flutter/material.dart';

import '../constans/styles/colors_const.dart';
import '../constans/styles/text_styles_const.dart';

Expanded buildBlogItems() {
  return Expanded(
      child: GridView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: 100,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 16,
              childAspectRatio: 174 / 266),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ArticalDetailPage()));
              }),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 210,
                      child: Stack(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16)),
                              color: BlogAppColors.iconPassive,
                            ),
                          ),
                          const Positioned(
                              top: 8, right: 8, child: Icon(Icons.favorite)),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 56,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16)),
                          color: BlogAppColors.iconPassive.withOpacity(0.5),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                "Article $index",
                                style: BlogAppTextStyles.buttonText
                                    .copyWith(color: BlogAppColors.iconActive),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
            );
          }));
}
