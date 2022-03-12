import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String message,
    {required Color backgroundColor, int? lengthInSc}) {
  var snackBar = SnackBar(
    duration: Duration(seconds: lengthInSc ?? 4),
    content: Text(message),
    backgroundColor: backgroundColor,
  );
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
