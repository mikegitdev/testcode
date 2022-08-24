import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasker/app_utils/app_color.dart';
import 'package:tasker/emoji_text.dart';
import 'package:tasker/models/emoji_model.dart';

class Emoji extends StatelessWidget {
  EmojiModel object;

  Emoji({
    Key? key,
    required this.object,
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

        //   color: Colors.amber,
        child: EmojiText(
          size: 32.w,
          text: object.emoji,
        ),
      ),
    );
  }
}
