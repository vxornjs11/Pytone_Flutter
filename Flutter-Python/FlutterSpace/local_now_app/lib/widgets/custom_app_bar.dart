import 'package:flutter/material.dart';

//
// Create on 2023-02-23
// author: Sangwon Kim
// Description: AppBar 위젯
//

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final String title;

  const CustomAppBar({super.key, required this.appBar, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          // fontWeight: FontWeight.bold,
        ),
      ),
      elevation: 0.2,
      centerTitle: true,
    );
  }

  // @override
  // Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Size get preferredSize =>
      Size.fromHeight(appBar.preferredSize.height * 0.8);
}
