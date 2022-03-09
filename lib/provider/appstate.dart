import 'package:flutter/cupertino.dart';

class AppState with ChangeNotifier {
  double queryWidth =
      MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width;
  double queryHeight =
      MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.height;
}
