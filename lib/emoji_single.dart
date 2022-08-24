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
        height: 72.h,
        width: 100.w,
        padding: EdgeInsets.only(top: 8.h, bottom: 4.h),
        decoration: BoxDecoration(
          color: AppColor.cF3F8FF,
          borderRadius: BorderRadius.circular(12.h),
          border: Border.all(color: AppColor.c0B4499, width: 1.0),
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
    );
  }
}
