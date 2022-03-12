import 'dart:convert';
import 'package:blog_app/constans/api/api_constants.dart';
import 'package:blog_app/models/blogs_model.dart';
import 'package:blog_app/models/categories_model.dart';
import 'package:blog_app/utility/show_error_message.dart';
import 'package:blog_app/services/context/global_context.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../constans/styles/colors_const.dart';
import '../../models/categories_model.dart';
import 'IAppService.dart';

class AppService extends IAppService {
  final String urlCategories =
      "http://test20.internative.net/Blog/GetCategories";

  @override
  Future<CategoriesModel?> fetchCategories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString("token");

    try {
      var res = await http.get(
        Uri.parse(urlCategories),
        headers: {"accept": "*/*", "Authorization": "Bearer $token"},
      );

      if (res.statusCode >= 200 && res.statusCode <= 299) {
        var response = CategoriesModel.fromJson(jsonDecode(res.body));

        return response;
      } else {
        showMessage(
            context: NavigationService.navigatorKey.currentState!,
            resBody: res.body,
            color: BlogAppColors.errorColor);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<BlogsModel?> fetchBlogs(
      {String? categoryID, required String token}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString("token");

    Map<String, dynamic> body = {
      "CategoryId": "",
    };

    try {
      var res = await http.post(Uri.parse((ApiEnums.postBlogGetBlogs.reqUrl)),
          body: json.encode(body),
          headers: (ApiEnums.postBlogGetBlogs.header(token: token)));

      if (res.statusCode >= 200 && res.statusCode <= 299) {
        var jsonBody = BlogsModel.fromJson(jsonDecode(res.body));

        return jsonBody;
      } else {
        showMessage(
            context: NavigationService.navigatorKey.currentState!,
            resBody: res.body,
            color: BlogAppColors.errorColor);

        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
