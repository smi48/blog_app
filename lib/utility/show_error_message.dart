import 'dart:convert';

import 'package:flutter/material.dart';

import 'snackbar.dart';
import '../services/context/global_context.dart';

dynamic showMessage(
    {required dynamic context, required String resBody, required Color color}) {
  Map<String, dynamic> resp = json.decode(resBody);
  var message = resp["Message"];
  return showSnackBar(
      NavigationService.navigatorKey.currentState!.context, message.toString(),
      backgroundColor: color);
}
