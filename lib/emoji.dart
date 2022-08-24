import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasker/app_utils/app_color.dart';
import 'package:tasker/emoji_text.dart';

class Emoji extends StatelessWidget {
  String emojiName;

  Emoji({
    Key? key,
    required this.emojiName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint("selectedImgIndex");
      },
      child: Container(
        height: 32.h,
        width: 32.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.cF3F8FF,
          borderRadius: BorderRadius.circular(12.h),
        ),
        //   color: Colors.amber,
        child: EmojiText(
          size: 32.w,
          text: emojiName,
        ),
      ),
    );
  }
}
