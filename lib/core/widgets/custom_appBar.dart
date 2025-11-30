import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? backButton;

  const CustomAppBar({super.key, required this.title, this.backButton});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: backButton ?? true,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 30.sp, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
