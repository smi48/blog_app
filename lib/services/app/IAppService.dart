// ignore_for_file: file_names

import '../../models/blogs_model.dart';
import '../../models/categories_model.dart';

abstract class IAppService {
  Future<CategoriesModel?> fetchCategories();
  Future<BlogsModel?> fetchBlogs({String? categoryID, required String token});
}
