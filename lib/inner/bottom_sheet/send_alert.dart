import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tasker/app_utils/app_color.dart';
import 'package:tasker/app_utils/app_text_style.dart';
import 'package:tasker/inner/bottom_sheet/back_button.dart';
import 'package:tasker/inner/component/custom_elevated_button.dart';
import 'package:tasker/inner/create_rostr/createRostr_controller.dart';
import 'package:tasker/inner/local_back.dart';

class SentAlert extends GetView<CreateRostrController> {
  const SentAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateRostrController>(builder: (ctrl) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CustomBackButton(),
          12.verticalSpace,
          Container(
            height: 500.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.r),
                topRight: Radius.circular(25.r),
              ),
            ),
            padding: EdgeInsets.only(top: 8.h),
            //  height: 626.h,
            child: Stack(
              children: [
                Column(
                  children: <Widget>[
                    Container(
                      height: 5.h,
                      width: 64.w,
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    24.verticalSpace,
                    Text(
                      "Send Alert To",
                      style: AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
                    ),
                    12.verticalSpace,
                    Text(
                      "Select chats",
                      style: AppTextStyle.regularNormal
                          .copyWith(fontSize: 12.sp, color: AppColor.c676F80),
                    ),
                    36.verticalSpace,
                    Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.changePageIndex(0);
                              },
                              child: Container(
                                height: 40.h,
                                alignment: Alignment.center,
                                width: 100,
                                decoration: BoxDecoration(
                                  gradient: controller.pageIndex == 0 ? AppColor.gradient_03 : null,
                                  color: controller.pageIndex == 0 ? AppColor.cF9F9F9 : null,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  "Direct",
                                  style: AppTextStyle.boldNormal.copyWith(
                                    color: controller.pageIndex == 0 ? AppColor.white : AppColor.c676F80,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {
                                controller.changePageIndex(1);
                              },
                              child: Container(
                                height: 40.h,
                                alignment: Alignment.center,
                                width: 100,
                                decoration: BoxDecoration(
                                  gradient: controller.pageIndex == 1 ? AppColor.gradient_03 : null,
                                  color: controller.pageIndex == 1 ? AppColor.cF9F9F9 : null,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  "Group",
                                  style: AppTextStyle.boldNormal.copyWith(
                                    color: controller.pageIndex == 1 ? AppColor.white : AppColor.c676F80,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    12.verticalSpace,
                    SizedBox(
                      height: 250,
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: controller.pageController,
                        children: [

                          //Direct
                          Padding(
                            padding: const EdgeInsets.only(left: 24, right: 24),
                            child: GridView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                childAspectRatio: 1,
                              ),
                              itemBuilder: (BuildContext ctx, index) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller.changeDirectIndex(index);
                                      },
                                      child: Container(
                                        alignment: Alignment.bottomRight,
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: controller.directIndex ==
                                                  index
                                                  ? AppColor.c41A3F0
                                                  : AppColor.white,
                                              width: 3),
                                          borderRadius:
                                          BorderRadius.circular(8),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(directModelList[index].image),
                                          ),
                                        ),
                                        child: Visibility(
                                          visible:
                                          controller.directIndex == index,
                                          child: SvgPicture.asset(
                                            'assets/icons/ic_check.svg',
                                            height: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    5.verticalSpace,
                                    Text(directModelList[index].name)
                                  ],
                                );
                              },
                              itemCount: directModelList.length,
                            ),
                          ),

                          //Group
                          Padding(
                            padding: const EdgeInsets.only(left: 24, right: 24),
                            child: GridView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    childAspectRatio: 1,
                              ),
                              itemBuilder: (BuildContext ctx, index) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller.changeGroupIndex(index);
                                      },
                                      child: Container(
                                        alignment: Alignment.bottomRight,
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: controller.groupIndex ==
                                                      index
                                                  ? AppColor.c41A3F0
                                                  : AppColor.white,
                                              width: 3),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(groupModelList[index].image),
                                          ),
                                        ),
                                        child: Visibility(
                                          visible:
                                              controller.groupIndex == index,
                                          child: SvgPicture.asset(
                                            'assets/icons/ic_check.svg',
                                            height: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    5.verticalSpace,
                                    Text(groupModelList[index].name)
                                  ],
                                );
                              },
                              itemCount: groupModelList.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //
                Padding(
                  padding: EdgeInsets.only(bottom: 19.h),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: CustomElevatedButton(
                        title: 'Send',
                        hasGradient: true,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
