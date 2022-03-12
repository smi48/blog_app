import 'dart:io';
import 'package:blog_app/screens/auth/login_page.dart';
import 'package:blog_app/services/context/global_context.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:blog_app/provider/appstate.dart';
import 'package:blog_app/services/app/app_service.dart';

import 'themes/main_theme.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppService _appService = AppService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppState(
            appService: _appService,
          ),
        )
      ],
      child: MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        builder: (context, child) => MediaQuery(
            child: child!,
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0)),
        debugShowCheckedModeBanner: false,
        title: 'Blog App',
        theme: mainTheme(),
        home: const LoginPage(),
      ),
    );
  }
}
