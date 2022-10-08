import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tasker/inner/bottom_sheet/back_button.dart';
import 'package:tasker/inner/rostr_info/user_controller.dart';
import 'package:tasker/inner/rostr_info/users_groups_controller.dart';
import 'package:tasker/list/group_list.dart';
import 'package:tasker/list/user_list.dart';

import '../../app_utils/app_color.dart';
import '../../app_utils/app_text_style.dart';
class SendAlertToBottom extends GetView<GetMaterialController> {
  SendAlertToBottom({Key? key}) : super(key: key);

  int count=0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetMaterialController>(builder: (ctrl) {
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
            //height: 400.h,
            child: Column(
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
                      .copyWith(fontSize: 12.sp, color: AppColor.c62677D),
                ),
                12.verticalSpace,
                DefaultTabController(
                  length: 2,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 400.h,
                    child: Column(
                      children: [
                        TabBar(
                          unselectedLabelColor: Colors.grey,
                          labelColor: Colors.blue,
                          indicatorColor: Colors.transparent,
                          onTap: (index){
                            count=index;
                            controller.update();
                          },
                          tabs: [
                            Tab(
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  color: count == 0 ? Colors.blue : Colors.grey,
                                ),
                                child: Center(
                                  child: Text(
                                    "Direct",
                                    style: AppTextStyle.boldNormal
                                       .copyWith(color: Colors.white, fontSize: 12.sp),
                                  ),
                                ),
                              ),
                              //isActive(),
                            ),
                            Tab(
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  color: count == 1 ? Colors.blue : Colors.grey,
                                ),
                                child: Center(
                                  child: Text(
                                    "Group",
                                    style: AppTextStyle.boldNormal
                                        .copyWith(color: Colors.white, fontSize: 12.sp),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              UserList(),
                              const GroupList(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     //#Direct button
                //     Container(
                //       width: 100.h,
                //       height: 32.h,
                //       decoration: BoxDecoration(
                //           gradient: controller.pageIndex == 0 ? AppColor.gradient_03 : null,
                //           //color: controller.pageIndex == 0 ? null : Colors.grey,
                //           borderRadius: BorderRadius.circular(4.r)),
                //       child: ElevatedButton(
                //         onPressed: () {
                //           controller.changeColor(0);
                //         }, //AppColor.gradient_03
                //         style: ElevatedButton.styleFrom(
                //           //fixedSize: Size(120.h, 28.h),
                //           primary: controller.pageIndex == 0 ? null : Colors.grey,
                //           shadowColor: Colors.transparent,
                //         ),
                //         child: Center(
                //           child: Text(
                //             'Direct',
                //             style: AppTextStyle.boldNormal
                //                 .copyWith(color: Colors.white, fontSize: 12.sp),
                //           ),
                //         ),
                //       ),
                //     ),
                //
                //     SizedBox(
                //       width: 12.w,
                //     ),
                //
                //     //#Group button
                //     Container(
                //       width: 100.h,
                //       height: 32.h,
                //       decoration: BoxDecoration(
                //           gradient: controller.pageIndex == 1 ? AppColor.gradient_03 : null,
                //           //color: controller.pageIndex == 1 ? null : Colors.grey,
                //           //color: Colors.grey,
                //           borderRadius: BorderRadius.circular(4.r)),
                //       child: ElevatedButton(
                //         onPressed: () {
                //           controller.changeColor(1);
                //         },
                //         style: ElevatedButton.styleFrom(
                //           primary: controller.pageIndex == 1 ? null : Colors.grey,
                //           shadowColor: Colors.transparent,
                //         ),
                //         child: Center(
                //           child: Text(
                //             'Groups',
                //             style: AppTextStyle.boldNormal.copyWith(
                //                 color: AppColor.white, fontSize: 12.sp),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // 20.verticalSpace,
                // SizedBox(
                //   //height: controller.isCreatedExist ? 450.h : 346.h,
                //   height: 346.h,
                //   child: PageView(
                //     onPageChanged: (index){
                //       controller.changeColor(index);
                //     },
                //     controller: controller.pageController,
                //     scrollDirection: Axis.horizontal,
                //     children: [
                //       UserList(),
                //       GroupList(),
                //     ],
                //   ),
                // ),
                Container(
                  height: 40.h,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 24.w),

                  decoration: BoxDecoration(
                      gradient:  _sendColorGroup() || _sendColorUser() ? AppColor.gradient_03 :  null,
                      color:  _sendColorGroup() || _sendColorUser() ? null : AppColor.cE2F1FD,
                      borderRadius: BorderRadius.circular(12.r),
                  ),

                  child: Center(
                    child: Text(
                        'Send',
                        style: AppTextStyle.boldNormal.copyWith(
                            fontSize: 16.sp,
                            color: AppColor.white,
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
  }


  bool _sendColorUser() {
    final user = Get.find<UserController>().localUser;
    List<bool> selectedProperties = user.map((e) => e.isSelected).toList();
    return selectedProperties.contains(true);
  }


  bool _sendColorGroup() {
    final group = Get.find<UsersGroupsController>().localGroup;
    List<bool> selectedProperties = group.map((e) => e.isSelected).toList();
    return selectedProperties.contains(true);
  }
}

