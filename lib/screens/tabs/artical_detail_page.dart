import 'package:blog_app/constans/styles/colors_const.dart';
import 'package:flutter/material.dart';

class ArticalDetailPage extends StatelessWidget {
  const ArticalDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artical Detail'),
        centerTitle: true,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: BlogAppColors.iconActive),
      ),
      body: const Center(
        child: Text("Artical Detail"),
      ),
    );
  }
}
