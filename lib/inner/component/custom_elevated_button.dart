import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasker/app_utils/app_color.dart';
import 'package:tasker/app_utils/app_text_style.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final bool hasGradient;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    Key? key,
    required this.title,
    required this.hasGradient,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48.h,
      decoration: BoxDecoration(
        gradient: hasGradient ? AppColor.gradient_03 : null,
        borderRadius:
            BorderRadius.all(Radius.circular(hasGradient ? 12.r : 8.r)),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          padding: EdgeInsets.zero,
          primary: hasGradient ? AppColor.transparent : AppColor.cCFE8FB,
          shadowColor: AppColor.transparent,
          onPrimary: AppColor.c41A3F0,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(hasGradient ? 12.r : 8.r))),
        ),
        child: hasGradient
            ? Center(
            child: Text(
                title,
              style: AppTextStyle.boldNormal.copyWith(
                  color: Colors.white,
                  fontSize: 16.sp,
              ),
            ),
        )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/add.svg',
                    height: 18.h,
                    width: 18.w,
                    color: AppColor.c41A3F0,
                  ),
                  14.horizontalSpace,
                  Text(
                    title,
                    style: AppTextStyle.boldNormal.copyWith(
                      fontSize: 16.sp,
                      color: const Color(0xff41A3F0),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
