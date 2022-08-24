import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tasker/app_utils/app_color.dart';
import 'package:tasker/app_route/app_route_name.dart';
import 'package:tasker/app_utils/app_text_style.dart';
import 'package:tasker/emoji_single.dart';
import 'package:tasker/inner/bottom_sheet/back_button.dart';
import 'package:tasker/inner/local_back.dart';
import 'package:tasker/inner/rostr_info/inner_controller.dart';

import 'create_alert_bottom.dart';
import 'share_alert_bottom.dart';

class SendAlertBottom extends GetView<InnerController> {
  const SendAlertBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InnerController>(builder: (ctr) {
      return StatefulBuilder(builder: (context, update) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CustomBackButton(),
            12.verticalSpace,
            Container(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 60.w,
                      ),
                      Text(
                        "Send Alert",
                        style:
                            AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(AppRouteName.editAlert);
                        },
                        child: Text(
                          "Edit",
                          style: AppTextStyle.boldNormal
                              .copyWith(fontSize: 16.sp, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                  4.verticalSpace,
                  Text(
                    "Please, choose an emoji and type in an alert name",
                    style: AppTextStyle.regularNormal
                        .copyWith(fontSize: 12.sp, color: AppColor.c62677D),
                  ),
                  20.verticalSpace,
                  SizedBox(
                    height: controller.isCreatedExist ? 450.h : 346.h,
                    child: ListView(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          height: 350.h,
                          child: GridView.builder(
                            physics: controller.isCreatedExist ? const NeverScrollableScrollPhysics() : null,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 140,
                              childAspectRatio: 3 / 2.14,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 12,
                            ),
                            itemBuilder: (BuildContext ctx, index) {
                              return GestureDetector(
                                onTap: () {
                                  update(() {
                                    controller.chooseEmoji(
                                        controller.localEmojis[index]);
                                  });
                                },
                                child: EmojiSingle(
                                  object: controller.localEmojis[index],
                                ),
                              );
                            },
                            itemCount: controller.localEmojis.length,
                          ),
                        ),
                        controller.createdEmojis != null &&
                                controller.createdEmojis!.isNotEmpty
                            ? Column(
                                children: [
                                  24.verticalSpace,
                                  Text(
                                    "Custom Alerts",
                                    style: AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
                                  ),
                                  24.verticalSpace,
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 24.w),
                                    height: 200.h,
                                    child: GridView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 140,
                                        childAspectRatio: 3 / 2.14,
                                        crossAxisSpacing: 8,
                                        mainAxisSpacing: 12,
                                      ),
                                      itemBuilder: (BuildContext ctx, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            update(() {
                                              controller.chooseEmoji(controller
                                                  .createdEmojis![index]);
                                            });
                                          },
                                          child: EmojiSingle(
                                            object: controller
                                                .createdEmojis![index],
                                          ),
                                        );
                                      },
                                      itemCount:
                                          controller.createdEmojis!.length,
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                  24.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: AppColor.gradient_03,
                          borderRadius: BorderRadius.circular(12.r)),
                      child: ElevatedButton(
                        onPressed: () {
                          if (controller.selectedEmoji != null) {
                            controller.openBottomSheet(
                                bottomSheet: const ShareAlertBottom());
                          }
                        }, //AppColor.gradient_03
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            'Continue',
                            style: AppTextStyle.boldNormal
                                .copyWith(color: Colors.white, fontSize: 16.sp),
                          ),
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
                        controller.openBottomSheet(
                            bottomSheet: const CreateAlertBottom(),
                            isCleanCreatedEmoji: true);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        primary: AppColor.cCFE8FB,
                        fixedSize: Size.fromHeight(48.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r)),
                      ),
                      child: Center(
                        child: Text(
                          'Add Custom Alert',
                          style: AppTextStyle.boldNormal.copyWith(
                              color: AppColor.c41A3F0, fontSize: 16.sp),
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
      });
    });
  }
}
