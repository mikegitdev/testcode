import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasker/app_utils/app_color.dart';
import 'package:tasker/app_utils/app_text_style.dart';

class CustomTextField extends StatelessWidget {
  final String? initialValue;
  final String? labelText;
  final String hintText;
  final int? maxLines;
  final void Function(String)? onChanged;
  final TextEditingController textController;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.textController,
    this.initialValue,
    this.labelText,
    this.onChanged,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,

      style: AppTextStyle.regularNormal.copyWith(color: AppColor.c15213B, fontSize: 16.sp,),
      initialValue: initialValue,
      maxLines: maxLines,

      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.cF6FAFE,
        hintText: hintText,
        labelText: labelText,
        alignLabelWithHint: false,
        floatingLabelAlignment: FloatingLabelAlignment.start,

        hintStyle: AppTextStyle.regularNormal.copyWith(
          fontSize: 16.sp,
          color: AppColor.c969BA7,
          fontWeight: FontWeight.w400,
        ),
        labelStyle: AppTextStyle.regularNormal.copyWith(
          fontSize: 12.sp,
          color: AppColor.c969BA7,
        ),
        floatingLabelStyle: AppTextStyle.regularNormal.copyWith(
          fontSize: 16.sp,
          color: AppColor.c969BA7,
        ),

        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),


        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColor.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColor.transparent),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColor.transparent),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
