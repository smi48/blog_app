import 'package:blog_app/models/blogs_model.dart';
import 'package:blog_app/models/categories_model.dart';
import 'package:flutter/cupertino.dart';

import 'package:blog_app/services/app/IAppService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState with ChangeNotifier {
  final IAppService appService;
  AppState({
    required this.appService,
  });

  late String? token;

  CategoriesModel? categories;
  BlogsModel? blogs;

  double queryWidth =
      MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width;
  double queryHeight =
      MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.height;

  setTokenToDevice({required String token}) async {
    var shared = await SharedPreferences.getInstance();

    shared.setString("token", token);
    this.token = token;
  }

  getCategories() async {
    var cats = await appService.fetchCategories();
    categories = cats;
    notifyListeners();
  }

  getBlogs() async {
    var shared = await SharedPreferences.getInstance();
    token = shared.getString("token");
    if (token != null) {
      var bl = await appService.fetchBlogs(token: token!);
      blogs = bl;
      notifyListeners();
    }
  }
}
