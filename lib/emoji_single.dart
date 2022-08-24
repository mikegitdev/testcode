import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasker/app_utils/app_color.dart';
import 'package:tasker/app_utils/app_text_style.dart';
import 'package:tasker/emoji_text.dart';

class EmojiSIngle extends StatelessWidget {
  String emojiName;
  String emoji;

  EmojiSIngle({
    Key? key,
    required this.emojiName,
    required this.emoji,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint("selectedImgIndex");
      },
      child: Container(
        height: 74.h,
        width: 104.w,
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            gradient: const LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  // border-image-source: linear-gradient(51.32deg, #56CCF2 6.11%, #2F80ED 84.94%);
                  Color(0xff56CCF2),
                  Color(0xff2F80ED),
                ])
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
              EmojiText(size: 32.h, text: emoji),
              SizedBox(
                height: 5.h,
              ),
              Text(emojiName,
                  style: AppTextStyle.regularNormal
                      .copyWith(fontSize: 14.sp, color: AppColor.c676F80)),
            ],
          ),
        ),
      ),
    );
  }
}
