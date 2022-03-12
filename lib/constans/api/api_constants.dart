enum ApiEnums {
  getAccountGet,
  postAccountUpdate,
  postBlogGetBlogs,
  getBlogGetCat,
  postBlogToggle,
  postGenUpLoadImg,
  postSignIn,
  postSignUp,
}

extension ApiUrlsExtension on ApiEnums {
  String get reqUrl {
    switch (this) {
      case ApiEnums.getAccountGet:
        return "http://test20.internative.net/Account/Get";
      case ApiEnums.postAccountUpdate:
        return "http://test20.internative.net/Account/Update";
      case ApiEnums.postBlogGetBlogs:
        return "http://test20.internative.net/Blog/GetBlogs";
      case ApiEnums.getBlogGetCat:
        return "http://test20.internative.net/Blog/GetCategories";
      case ApiEnums.postBlogToggle:
        return "http://test20.internative.net/Blog/ToggleFavorite";
      case ApiEnums.postGenUpLoadImg:
        return "http://test20.internative.net/General/UploadImage";
      case ApiEnums.postSignIn:
        return "http://test20.internative.net/Login/SignIn";
      case ApiEnums.postSignUp:
        return "http://test20.internative.net/Login/SignUp";
    }
  }

  Map<String, String> header({String? token}) {
    switch (this) {
      case ApiEnums.getAccountGet:
        return {
          "accept": "*/*",
          //  "Content-Type": "applicatin/json",
          "Authorization": "Bearer $token",
        };
      case ApiEnums.postAccountUpdate:
        return {
          "accept": "*/*",
          "Authorization": "Bearer $token",
          "Content-Type": "applicatin/json",
        };
      case ApiEnums.postBlogGetBlogs:
        return {
          "accept": "*/*",
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        };
      case ApiEnums.getBlogGetCat:
        return {
          "accept": "*/*",
          "Authorization": "Bearer $token",
          // "Content-Type": "applicatin/json",
        };
      case ApiEnums.postBlogToggle:
        return {
          "accept": "*/*",
          "Authorization": "Bearer $token",
          "Content-Type": "applicatin/json",
        };
      case ApiEnums.postGenUpLoadImg:
        return {
          "accept": "applicatin/json",
          "Authorization": "Bearer $token",
          "Content-Type": "multipart/form-data",
        };
      case ApiEnums.postSignIn:
        return {
          "accept": "*/*",
          "Authorization": "Bearer $token",
          "Content-Type": "applicatin/json",
        };
      case ApiEnums.postSignUp:
        return {
          "accept": "*/*",
          "Authorization": "Bearer $token",
          "Content-Type": "applicatin/json",
        };
    }
  }
}
