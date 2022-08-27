import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tasker/app_utils/app_color.dart';
import 'package:tasker/app_utils/app_text_style.dart';
import 'package:tasker/inner/bottom_sheet/back_button.dart';
import 'package:tasker/inner/component/custom_elevated_button.dart';
import 'package:tasker/inner/create_rostr/createRostr_controller.dart';

class RatingBottomSheet extends GetView<CreateRostrController> {
  final int superIndex;
  const RatingBottomSheet({Key? key, required this.superIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateRostrController>(
        builder: (ctr) {
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
                      padding: EdgeInsets.only(top: 8.h, left: 24.w, right: 24.w,),
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
                          24.verticalSpace,
                          Text(
                            '${controller.rating[superIndex].title} Rating',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.boldNormal.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w700,),
                          ),
                          12.verticalSpace,
                          Text(
                            'Please, rate this rostrs “${controller.rating[superIndex].title}” rating using stars below',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.regularNormal.copyWith(fontSize: 12.sp, color: AppColor.c62677D, fontWeight: FontWeight.w400,),
                          ),
                          20.verticalSpace,
                          Wrap(
                            spacing: 6.w,
                            runSpacing: 12.h,
                            children: List.generate(
                              10,
                              (index) {
                                return GestureDetector(
                                  onTap: (){
                                    controller.updateRating(superIndex, index);
                                  },
                                  child: Container(
                                    height: 43.h,
                                    width: 60.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(999),
                                      color: index + 1 <= controller.rating[superIndex].score
                                          ? AppColor.c83C3F5 : AppColor.cF6FAFE,
                                    ),
                                    child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.grade,
                                      color: index + 1 <= controller.rating[superIndex].score
                                          ? AppColor.white : AppColor.c969BA7,
                                      size: 15,
                                    ),
                                    4.horizontalSpace,
                                    Text(
                                      '${index + 1}',
                                      style: AppTextStyle.boldNormal.copyWith(
                                        color: index + 1 <= controller.rating[superIndex].score
                                            ? AppColor.white : AppColor.c969BA7,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16.sp,
                                      ),
                                    )
                                  ],
                              ),
                                  ),
                                );
                                },
                            ),
                          ),
                          32.verticalSpace,
                          CustomElevatedButton(
                            title: 'Save',
                            hasGradient: true,
                            onPressed: (){
                              Get.back();
                            },
                          ),
                          16.verticalSpace,
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