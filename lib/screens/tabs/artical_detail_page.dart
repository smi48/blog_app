import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:blog_app/constans/styles/colors_const.dart';

class ArticalDetailPage extends StatelessWidget {
  final String title;
  final String image;
  final String textHtml;

  const ArticalDetailPage({
    Key? key,
    required this.title,
    required this.image,
    required this.textHtml,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
          automaticallyImplyLeading: true,
          iconTheme: const IconThemeData(color: BlogAppColors.iconActive),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        image,
                        fit: BoxFit.fitHeight,
                      ),
                    )),
                Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: ListView(
                        children: [
                          HtmlWidget(textHtml),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
