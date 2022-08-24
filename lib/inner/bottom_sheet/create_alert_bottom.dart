import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tasker/app_utils/app_color.dart';
import 'package:tasker/app_utils/app_text_style.dart';
import 'package:tasker/emoji_text.dart';
import 'package:tasker/inner/bottom_sheet/back_button.dart';
import 'package:tasker/inner/rostr_info/inner_controller.dart';

import '../local_back.dart';

class CreateAlertBottom extends GetView<InnerController> {
  const CreateAlertBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InnerController>(builder: (ctr) {
      return StatefulBuilder(
        builder: (context, update) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CustomBackButton(),
                12.verticalSpace,
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25.r)),
                  ),
                  padding: EdgeInsets.only(top: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 5.h,
                          width: 64.w,
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      12.verticalSpace,
                      Text(
                        "Create Alert",
                        textAlign: TextAlign.center,
                        style:
                            AppTextStyle.boldNormal.copyWith(fontSize: 16.sp),
                      ),
                      12.verticalSpace,
                      Text(
                        "Please, choose an emoji and type in an alert name",
                        textAlign: TextAlign.center,
                        style: AppTextStyle.regularNormal
                            .copyWith(fontSize: 12.sp, color: AppColor.c62677D),
                      ),
                      12.verticalSpace,
                      Padding(
                        padding: EdgeInsets.only(left: 24.w),
                        child: Text(
                          "Choose an Emoji",
                          style:
                              AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
                        ),
                      ),
                      12.verticalSpace,
                      SizedBox(
                        height: 300.h,
                        child: GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 40,
                            childAspectRatio: 3 / 2.7,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (BuildContext ctx, index) {
                            return GestureDetector(
                              onTap: () {
                                update(() {
                                  controller.chooseEmojiImage(emojisSet[index]);
                                });
                              },
                              child: Stack(
                                children: [
                                  controller.createEmojiImage.isNotEmpty && controller.createEmojiImage == emojisSet[index].emoji
                                      ? Positioned.fill(
                                          child: Container(
                                            padding: const EdgeInsets.all(2),
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColor.c41A3F0,
                                            ),
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColor.white,
                                              ),
                                              child: FittedBox(
                                                child: EmojiText(
                                                  size: 28.sp,
                                                  text: emojisSet[index].emoji,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Center(
                                        child: FittedBox(
                                          child: EmojiText(
                                              size: 28.sp,
                                              text: emojisSet[index].emoji,
                                            ),
                                        ),
                                      ),
                                  Visibility(
                                    visible: controller.createEmojiImage.isNotEmpty && controller.createEmojiImage != emojisSet[index].emoji,
                                    child: Container(color: Colors.white60),
                                  ),
                                  controller.createEmojiImage.isNotEmpty && controller.createEmojiImage == emojisSet[index].emoji
                                      ? Positioned(
                                          bottom: 2.0,
                                          right: 2.0,
                                          child: SizedBox(
                                            height: 14.h,
                                            width: 14.w,
                                            child: SvgPicture.asset(
                                                'assets/icons/ic_check.svg'),
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                ],
                              ),
                            );
                          },
                          itemCount: emojisSet.length,
                        ),
                      ),
                      30.verticalSpace,
                      Padding(
                        padding: EdgeInsets.only(left: 24.w),
                        child: Text(
                          "Make up a Name",
                          style:
                              AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
                        ),
                      ),
                      14.verticalSpace,
                      Padding(
                        padding: EdgeInsets.only(
                          left: 24.w,
                          right: 24.w,
                        ),
                        child: TextFormField(
                          style: AppTextStyle.regularNormal.copyWith(
                            color: AppColor.c15213B,
                            fontSize: 16.sp,
                          ),
                          controller: controller.createEmojiTitle,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16.w),
                            fillColor: AppColor.cF6FAFE,
                            filled: true,
                            hintText: "e.g. Handsome",
                            labelStyle: AppTextStyle.regularNormal.copyWith(
                              color: AppColor.c969BA7,
                              fontSize: 12.sp,
                              height: 2.h,
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.r)),
                            ),
                          ),
                          onChanged: (text) {
                            update(() {
                              controller.canCreateEmoji();
                            });
                          },
                        ),
                      ),
                      20.verticalSpace,
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 24.w),
                        decoration: BoxDecoration(
                          gradient: controller.canCreateEmoji()
                              ? AppColor.gradient_03
                              : null,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: ElevatedButton(
                            onPressed: () {
                              controller.createEmoji();
                            }, //AppColor.gradient_03
                            style: ElevatedButton.styleFrom(
                                primary: controller.canCreateEmoji()
                                    ? Colors.transparent
                                    : AppColor.cCFE8FB,
                                shadowColor: Colors.transparent,
                                fixedSize: Size.fromHeight(48.h)),
                            child: Center(
                              child: Text(
                                'Continue',
                                style: AppTextStyle.boldNormal.copyWith(
                                    color: Colors.white, fontSize: 16.sp),
                              ),
                            )),
                      ),
                      20.verticalSpace,
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
