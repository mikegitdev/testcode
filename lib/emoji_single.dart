import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tasker/app_utils/app_color.dart';
import 'package:tasker/app_utils/app_text_style.dart';
import 'package:tasker/emoji_text.dart';
import 'package:tasker/inner/rostr_info/inner_controller.dart';
import 'package:tasker/data/models/emoji_model.dart';

class EmojiSingle extends GetView<InnerController> {
  final EmojiModel object;

  EmojiSingle({
    Key? key,
    required this.object,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InnerController>(
      builder: (ctr) {
        return Container(
          height: 74.h,
          width: 104.w,
          padding: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              gradient: object.isSelected ? const LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  // border-image-source: linear-gradient(51.32deg, #56CCF2 6.11%, #2F80ED 84.94%);
                  Color(0xff56CCF2),
                  Color(0xff2F80ED),
                ],
              ) : null,
          ),
          child: Container(
            padding: EdgeInsets.only(top: 8.h, bottom: 4.h),
            decoration: BoxDecoration(
              color: AppColor.cF6FAFE,
              borderRadius: BorderRadius.circular(12.r),
              // border: Border.all(color: AppColor.c0B4499, width: 2.0),
            ),
            //   color: Colors.amber,
            child: Column(
              children: [
                EmojiText(size: 32.h, text: object.emoji),
                SizedBox(height: 5.h),
                Text(
                  object.title!,
                  style: AppTextStyle.regularNormal.copyWith(fontSize: 14.sp, color: AppColor.c676F80),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
