import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SnackBarWidget {
  final BuildContext context;
  final String text;
  final VoidCallback whenComplete;
  final Duration duration;
  double fontSize = 9.0.sp;

  SnackBarWidget(
      {@required this.context, this.text, this.whenComplete, this.duration});

  void showCircularProgressSnackBar() {
    ScaffoldMessenger.of(context)
      ..deactivate()
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        duration: duration ?? const Duration(minutes: 1),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            ),
            CircularProgressIndicator(),
          ],
        ),
      ));
  }

  void showErrorSnackBar() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        duration: duration ?? const Duration(seconds: 5),
        content: Text(
          text,
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
      ));
  }

  void showSucceedSnackBar() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        duration: duration ?? const Duration(seconds: 5),
        content: Text(
          text,
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ));
  }

  void hideSnackBar() {
    ScaffoldMessenger.of(context)..hideCurrentSnackBar();
  }
}
