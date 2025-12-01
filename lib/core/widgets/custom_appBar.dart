import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? backButton;
  final double? fontSize;

  const CustomAppBar({super.key, required this.title, this.backButton, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: backButton ?? true,
      leading: backButton == true ? IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ): SizedBox(),
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: fontSize ?? 25.sp, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
