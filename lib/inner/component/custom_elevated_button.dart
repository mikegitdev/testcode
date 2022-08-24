import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasker/app_utils/app_color.dart';

class CustomElevatedButton extends StatelessWidget {
  final Gradient? gradient;
  final VoidCallback onPressed;
  final Widget child;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48.h,
      decoration: BoxDecoration(
        gradient: gradient ?? AppColor.gradient_03,
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: AppColor.transparent,
          shadowColor: AppColor.transparent,
          onPrimary: AppColor.c41A3F0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.r))),
        ),
        child: child,
      ),
    );
  }
}
