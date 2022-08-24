import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasker/app_color.dart';
import 'package:tasker/app_text_style.dart';
import 'package:tasker/inner/component/custom_switch.dart';

class CustomCheckboxListRemove extends StatelessWidget {
  final String text;
  final String middleText;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final String activeText;
  final String inactiveText;
  final Color activeTextColor;
  final Color inactiveTextColor;

  const CustomCheckboxListRemove({
    Key? key,
    required this.text,
    required this.middleText,
    required this.value,
    required this.onChanged,
    required this.activeColor,
    this.inactiveColor = AppColor.cE2F1FD,
    this.activeText = '',
    this.inactiveText = '',
    this.activeTextColor = Colors.white70,
    this.inactiveTextColor = Colors.white70,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: AppTextStyle.regularNormal.copyWith(
                fontSize: 16.sp,
                color: AppColor.c15213B,
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {},
              child: Text(
                middleText,
                style: AppTextStyle.regularNormal.copyWith(
                  fontSize: 16.sp,
                  color: AppColor.cE50101,
                ),
              ),
            ),
          ),
          36.horizontalSpace,
          CustomSwitch(
            value: value,
            onChanged: (value) {
              onChanged(value);
            },
            activeColor: activeColor,
            activeText: activeText,
            inactiveText: inactiveText,
            activeTextColor: activeTextColor,
            inactiveTextColor: inactiveTextColor,
          )
        ],
      ),
    );
  }
}
