import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/root_controller.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:tasker/inner/rostr_info/users_groups_controller.dart';
import 'package:tasker/user_group_single.dart';

import '../app_utils/app_text_style.dart';

class GroupList extends GetView<UsersGroupsController>{
  const GroupList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, update) {
      return ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            height: 350.h,
            child: GridView.builder(
              physics: controller.isCreatedExist
                  ? const NeverScrollableScrollPhysics()
                  : null,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                // maxCrossAxisExtent: 110,
                // childAspectRatio: 3 / 2.14,
                // crossAxisSpacing: 6,
                // mainAxisSpacing: 10,
                crossAxisCount: 4,
              ),
              itemBuilder: (BuildContext ctx, index) {
                return GestureDetector(
                  onTap: () {
                    update(() {
                      log("controller.localGroup[index]  ${controller.localGroup[index]}");
                      controller.chooseGroup(controller.localGroup[index]);
                      Get.find<GetMaterialController>().update();
                    });
                  },
                  child: UserGroupSingle(
                    object: controller.localGroup[index],
                  ),
                );
              },
              itemCount: controller.localGroup.length,
            ),
          ),
          controller.createdGroups != null &&
              controller.createdGroups!.isNotEmpty
              ? Column(
            children: [
              24.verticalSpace,
              Text(
                "Custom Alerts",
                style: AppTextStyle.boldNormal
                    .copyWith(fontSize: 18.sp),
              ),
              24.verticalSpace,
              Container(
                padding:
                EdgeInsets.symmetric(horizontal: 24.w),
                height: 200.h,
                child: GridView.builder(
                  physics:
                  const NeverScrollableScrollPhysics(),
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    //maxCrossAxisExtent: 100,
                    // childAspectRatio: 6 / 2.14,
                    crossAxisSpacing: 18,
                    // mainAxisSpacing: 6,
                    crossAxisCount: 4,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        update(() {
                          controller.chooseGroup(controller.createdGroups![index]);
                        });
                      },
                      child: UserGroupSingle(
                        object: controller.createdGroups![index],
                      ),
                    );
                  },
                  itemCount: controller.createdGroups!.length,
                ),
              ),
            ],
          )
              : const SizedBox.shrink(),
        ],
      );
    });
  }
}