import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final bool showBack;
  final Function? backButtonHandler;

  const CommonAppBar({
    super.key,
    required this.titleText,
    this.showBack = false,
    this.backButtonHandler,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titleText),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
