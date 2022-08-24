import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tasker/app_utils/app_color.dart';
import 'package:tasker/app_utils/app_text_style.dart';
import 'package:tasker/emoji_text.dart';

import 'create_alert_bottom.dart';
import 'send_alert_bottom.dart';

class SendToChatBottom extends StatelessWidget {
  final InnerController innerController;
  const SendToChatBottom({Key? key, required this.innerController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CustomBackButton(),
        12.verticalSpace,
        Container(
          // width: double.maxFinite,
          // height: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              topRight: Radius.circular(25.r),
            ),
          ),
          padding: EdgeInsets.only(top: 8.h),
          //  height: 626.h,
          child: Column(
            children: <Widget>[
              Container(
                height: 5.h,
                width: 64.w,
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(30)),
              ),
              12.verticalSpace,
              Text(
                "Send Alert",
                style: AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
              ),
              4.verticalSpace,
              Text(
                "Please, type a comment if you want and send the alert",
                style: AppTextStyle.regularNormal
                    .copyWith(fontSize: 12.sp, color: AppColor.c62677D),
              ),
              32.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Container(
                  height: 74.h,
                  width: 1.sw,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColor.cF3F8FF,
                  ),
                  child: Center(
                      child: Column(
                    children: [
                      6.verticalSpace,
                      EmojiText(size: 32.h, text: '😍'),
                      6.verticalSpace,
                      Text("Hot",
                          style: AppTextStyle.regularNormal.copyWith(
                              fontSize: 14.sp, color: AppColor.c676F80))
                    ],
                  )),
// (
//                   emoji: '😍',
//                   emojiName: 'Love',
//                 ),
                ),
              ),
              12.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: OutlinedButton(
                  onPressed: () {
                    debugPrint('SendAlertBottom');
                    Get.bottomSheet(
                      const SendAlertBottom(),
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    //  minimumSize: Size(1.sw, 48.h),
                    padding: EdgeInsets.zero,
                    side: BorderSide(
                      width: 1.0,
                      color: Color(0xff41A3F0),
                    ),
                    fixedSize: Size(1.sw, 48.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        12.0.r,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/upload.png',
                        height: 18.h,
                        color: AppColor.c41A3F0,
                      ),
                      8.horizontalSpace,
                      Text(
                        'Upload a Photo',
                        style: AppTextStyle.boldNormal.copyWith(
                          fontSize: 16.sp,
                          color: Color(0xff41A3F0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              12.verticalSpace,
              Padding(
                padding: EdgeInsets.only(left: 24.0.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Write a comment",
                    style: AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
                  ),
                ),
              ),
              12.verticalSpace,
              Padding(
                padding: EdgeInsets.only(
                  left: 24.0.w,
                  right: 24.0.w,
                  // bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: TextFormField(
                  style: AppTextStyle.regularNormal.copyWith(
                    color: AppColor.c15213B,
                    fontSize: 16.sp,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                    fillColor: AppColor.cF6FAFE,
                    filled: true,
                    // helperText: "Name",
                    labelText: "Name",
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    alignLabelWithHint: false,
                    floatingLabelStyle: AppTextStyle.regularNormal.copyWith(
                      fontSize: 16.sp,
                      color: AppColor.c969BA7,
                    ),
                    // hintText: "e.g. Handsome",
                    labelStyle: AppTextStyle.regularNormal.copyWith(
                      color: AppColor.c969BA7,
                      fontSize: 12.sp,
                      height: 2.h,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: Icon(Icons.highlight_off)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, style: BorderStyle.none),
                      borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    ),
                  ),
                ),
              ),
              12.verticalSpace,
              Padding(
                padding: EdgeInsets.only(
                  left: 24.0.w,
                  right: 24.0.w,
                  // bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: TextFormField(
                  style: AppTextStyle.regularNormal.copyWith(
                    color: AppColor.c15213B,
                    fontSize: 16.sp,
                  ),
                  maxLines: 8,
                  minLines: 8,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                    // fillColor: AppColor.cF6FAFE,
                    fillColor: AppColor.c00AE26,
                    filled: true,

                    // helperText: "Name",
                    labelText: "Comment",
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    alignLabelWithHint: false,
                    floatingLabelStyle: AppTextStyle.regularNormal.copyWith(
                      fontSize: 16.sp,
                      color: AppColor.c969BA7,
                    ),
                    // hintText: "e.g. Handsome",
                    labelStyle: AppTextStyle.regularNormal.copyWith(
                      color: AppColor.c969BA7,
                      fontSize: 12.sp,
                      height: 2.h,
                    ),
                    // suffixIcon: IconButton(
                    //     onPressed: () {}, icon: Icon(Icons.highlight_off)),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                      borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    ),
                  ),
                ),
              ),
              12.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: ElevatedButton(
                    onPressed: () {
                      // sendAlert(context);
                      Get.bottomSheet(
                        const CreateAlertBottom(),
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                      );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Send As Text',
                          style: AppTextStyle.boldNormal.copyWith(
                              color: AppColor.c41A3F0, fontSize: 16.sp),
                        ),
                      ],
                    )),
              ),
              12.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: AppColor.gradient_03,
                      borderRadius: BorderRadius.circular(12.r)),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.bottomSheet(
                        const SendToChatBottom(),
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                      );
                    }, //AppColor.gradient_03
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        8.horizontalSpace,
                        Text(
                          'Send To Chat',
                          style: AppTextStyle.boldNormal
                              .copyWith(color: Colors.white, fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              12.verticalSpace,
            ],
          ),
        ),
      ],
    );
  }
}
