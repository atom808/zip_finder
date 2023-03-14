import 'package:flutter/material.dart';

class DefaultAppBar extends AppBar {
  final String titleText;
  final bool showPop;
  final List<Widget>? trailing;

  DefaultAppBar({super.key, required this.titleText, this.showPop = true, this.trailing});

  Widget build(BuildContext context) {
    return AppBar(
      leading: Navigator.canPop(context) && showPop
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,
      actions: trailing,
      title: Text(titleText),
    );
  }
}


