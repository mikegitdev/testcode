import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tasker/app_utils/app_color.dart';
import 'package:tasker/appbar.dart';
import 'package:tasker/inner/component/custom_app_bar.dart';
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
      appBar: AppBarScreen(appbarTitle: 'Quick Ratings Edit'),
      // AppBar(
      //   elevation: 0,
      //   foregroundColor: AppColor.c15213B,
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      //   title: Text(
      //     'Quick Ratings Edit',
      //     style: AppTextStyle.regularNormal.copyWith(
      //       color: AppColor.c15213B,
      //       fontWeight: FontWeight.w700,
      //       fontSize: 16.sp,
      //     ),
      //   ),
      // ),
      body: GetBuilder<CreateRostrController>(
        builder: (ctr) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(left: 24.w, right: 24.w,bottom: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                36.verticalSpace,
                Text(
                  'Ratings Settings',
                  style: AppTextStyle.regularNormal.copyWith(
                    color: AppColor.c15213B,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                  ),
                ),
                26.verticalSpace,

                // * Ratings
                CustomSwitchListTile(
                  activeText: 'On',
                  inactiveText: 'Off',
                  text: 'Ratings',
                  activeColor: Colors.red,
                  activeTextColor: AppColor.white,
                  inactiveTextColor: AppColor.c969696,
                  value: true,
                  onChanged: (value) {},
                ),
                28.verticalSpace,

                // * Existing Ratings
                CustomLabel(
                  label: 'Existing Ratings',
                  onTap: () {},
                ),
                26.verticalSpace,

                // * RatingList
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.rating.length,
                  separatorBuilder: (BuildContext context, int index){
                    return 24.verticalSpace;
                  },
                  itemBuilder: (BuildContext context, int superIndex){
                    return Container(
                      padding: const EdgeInsets.only(top: 5),
                      height: 140.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.rating[superIndex].title,
                            style: AppTextStyle.boldNormal.copyWith(
                              color: AppColor.c15213B,
                              fontWeight: FontWeight.w700,
                              fontSize: 18.sp,
                            ),
                          ),
                          12.verticalSpace,
                          Wrap(
                            spacing: 6.w,
                            runSpacing: 12.h,
                            children: List.generate(
                              10,
                                  (index) {
                                return Container(
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
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                32.verticalSpace,
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
