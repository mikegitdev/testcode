import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tasker/app_utils/app_color.dart';
import 'package:tasker/inner/component/custom_checkbox_list.dart';
import 'package:tasker/inner/component/custom_elevated_button.dart';
import 'package:tasker/inner/component/custom_label_edit.dart';
import 'package:tasker/inner/create_rostr/createRostr_controller.dart';
import 'package:tasker/inner/local_back.dart';

import '../../app_utils/app_text_style.dart';

class CreateRating extends GetView<CreateRostrController> {
  const CreateRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //15213B
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: AppColor.c15213B,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Quick Ratings Edit',
          style: AppTextStyle.regularNormal.copyWith(
            color: AppColor.c15213B,
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: GetBuilder<CreateRostrController>(
        builder: (ctr) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(left: 24.w, right: 24.w,bottom: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                36.verticalSpace,

                //#Ratings Settings
                Text(
                  "Ratings Settings",
                  style: AppTextStyle.regularNormal.copyWith(
                    color: AppColor.c15213B,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                  ),
                ),
                26.verticalSpace,

                // * Ratings
                CustomSwitchListTile(
                  text: 'Ratings',
                  value: false,
                  onChanged: (value) {
                    // createRostrController.changeRating(value);
                  },
                  activeColor: Colors.red,
                  activeText: 'On',
                  inactiveText: 'Off',
                  activeTextColor: AppColor.white,
                  inactiveTextColor: AppColor.c969696,
                ),
                28.verticalSpace,
                //#Existing Ratings
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "",
                      style: AppTextStyle.regularNormal.copyWith(
                        color: AppColor.c15213B,
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Edit",
                        style: AppTextStyle.boldNormal.copyWith(
                          color: AppColor.cE50101, //E50101
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                26.verticalSpace,

                //#RatingList
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.rating.length,
                  itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.only(top: 5),
                    height: 160,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.rating[index].title,
                          style: AppTextStyle.boldNormal.copyWith(
                            color: AppColor.c15213B, //E50101
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp,
                          ),
                        ),
                        12.verticalSpace,
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: 10,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 60,
                            childAspectRatio: 10 / 7,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 12,
                          ),
                          itemBuilder: (context, index) =>
                              index == 8 || index == 9 ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColor.cF6FAFE,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                //#iconStar
                                const Icon(
                                  Icons.grade,
                                  color: AppColor.c969BA7,
                                  size: 18,
                                ),
                                4.horizontalSpace,

                                //#textIndex
                                Text(
                                  "${index + 1}",
                                  style: AppTextStyle.boldNormal.copyWith(
                                    color: AppColor.c969BA7, //E50101
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.sp,
                                  ),
                                )
                              ],
                            ),
                          ): Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.blue,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.grade,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    4.horizontalSpace,
                                    Text(
                                      "${index + 1}",
                                      style: AppTextStyle.boldNormal.copyWith(
                                        color: AppColor.white, //E50101
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18.sp,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),

                CustomElevatedButton(
                  title: 'Save',
                  hasGradient: true,
                  onPressed: (){},
                ),


              ],
            ),
          );
        }
      ),
    );
  }
}
