import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color titleColor;
  final bool? isCenter;
  final Color? bgColor;
  const CustomAppbar({super.key, required this.title, this.isCenter = false, this.titleColor = Colors.white, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(color: titleColor)),
      centerTitle: isCenter == true ? true : false,
      backgroundColor: bgColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
