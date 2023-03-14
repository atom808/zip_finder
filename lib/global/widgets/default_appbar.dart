import 'package:flutter/material.dart';

class DefaultAppBar extends AppBar {
  final String titleText;

  DefaultAppBar({super.key, required this.titleText});

  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      actions: actions,
      title: Text(titleText),
    );
  }
}
