import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasker/app_utils/app_text_style.dart';

class CustomLabel extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  const CustomLabel({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyle.boldNormal.copyWith(
            fontSize: 18.sp,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            "Edit",
            style: AppTextStyle.boldNormal.copyWith(
              fontSize: 16.sp,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
