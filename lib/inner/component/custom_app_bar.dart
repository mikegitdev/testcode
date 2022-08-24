import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasker/app_color.dart';
import 'package:tasker/app_icon.dart';
import 'package:tasker/app_text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          elevation: 0,
          backgroundColor: AppColor.white,
          leading: IconButton(
            onPressed: () {
              onBackPressed != null ? onBackPressed!() : Navigator.pop(context);
            },
            icon: SvgPicture.asset(
              AppIcon.toolbarBack,
              color: AppColor.c15213B,
            ),
          ),
          centerTitle: true,
          title: Text(
            title,
            style: AppTextStyle.boldNormal.copyWith(
              fontSize: 14.sp,
              color: AppColor.c15213B,
            ),
          ),
          actions: actions ?? [],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);
}
