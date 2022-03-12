import 'package:blog_app/screens/tabs/artical_detail_page.dart';
import 'package:flutter/material.dart';

import '../constans/styles/colors_const.dart';
import '../constans/styles/text_styles_const.dart';

GestureDetector buildBlogItem(BuildContext context, String title, int index,
    String image, String content) {
  return GestureDetector(
    onTap: (() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticalDetailPage(
                    title: title,
                    image: image,
                    textHtml: content * 5,
                  )));
    }),
    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Expanded(
        flex: 210,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Container(
                height: double.maxFinite,
                child: Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  color: BlogAppColors.iconPassive,
                ),
              ),
            ),
            const Positioned(
                top: 8,
                right: 8,
                child: Icon(
                  Icons.favorite,
                  color: BlogAppColors.appBarBg,
                )),
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
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16,
            ),
            child: Center(
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: BlogAppTextStyles.buttonText.copyWith(
                  color: BlogAppColors.iconActive,
                ),
              ),
            ),
          ),
        ),
      ),
    ]),
  );
}
