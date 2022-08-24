import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:tasker/app_utils/app_color.dart';
import 'package:tasker/app_utils/app_icon.dart';
import 'package:tasker/app_utils/app_text_style.dart';

class CenterTitleToolbar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const CenterTitleToolbar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: AppColor.white,
        leadingWidth: 0,
        leading: const SizedBox(),
        title: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () => Get.back(),
                icon: SvgPicture.asset(
                  AppIcon.toolbarBack,
                  color: AppColor.c15213B,
                ),
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.boldNormal.copyWith(
                    color: AppColor.c15213B,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);
}
