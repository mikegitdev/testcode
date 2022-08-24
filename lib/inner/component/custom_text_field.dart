import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasker/app_color.dart';
import 'package:tasker/app_text_style.dart';

class CustomTextField extends StatelessWidget {
  final String? initialValue;
  final String? labelText;
  final String hintText;
  final int? maxLines;
  final Function(String? value) onChanged;

  const CustomTextField({
    Key? key,
    this.initialValue,
    this.labelText,
    required this.hintText,
    required this.onChanged,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.cF6FAFE,
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
      child: TextFormField(
        onChanged: onChanged,
        initialValue: initialValue,
        style: AppTextStyle.regularNormal.copyWith(
          fontSize: 16.sp,
          color: AppColor.c15213B,
        ),
        maxLines: maxLines,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          border: InputBorder.none,
          isDense: true,
          hintText: hintText,
          labelText: labelText,
          hintStyle: AppTextStyle.regularNormal.copyWith(
            fontSize: 16.sp,
            color: AppColor.c969BA7,
          ),
          labelStyle: AppTextStyle.regularNormal.copyWith(
            fontSize: 12.sp,
            color: AppColor.c969BA7,
          ),
        ),
      ),
    );
  }
}
