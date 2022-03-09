import 'package:blog_app/constans/styles/text_styles_const.dart';
import 'package:flutter/material.dart';

import '../../components/blog_item.dart';
import '../../components/home_category.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: const Text("Home"), centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          SizedBox(
            height: screenHeight * 130 / 843,
            child: ListView.builder(
                padding: const EdgeInsets.only(left: 11),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return buildCategory(screenHeight, screenWidth, index);
                },
                itemCount: 100),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0, top: 28, bottom: 16),
            child: Text(
              "Blog",
              style: BlogAppTextStyles.pageTitle,
            ),
          ),
          buildBlogItems(),
        ],
      ),
    );
  }
}
