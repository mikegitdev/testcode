import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:tasker/inner/rostr_info/user_controller.dart';

import '../app_utils/app_text_style.dart';
import '../user_single.dart';

class UserList extends GetView<UserController>{

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
                      controller.chooseUser(controller.localUser[index]);
                    });
                    Get.find<GetMaterialController>().update();
                  },
                  child: UserSingle(
                    object: controller.localUser[index],
                  ),
                );
              },
              itemCount: controller.localUser.length,
            ),
          ),
          controller.createdUser != null &&
              controller.createdUser!.isNotEmpty
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
                          controller.chooseUser(
                              controller.createdUser![index]);
                        });
                      },
                      child: UserSingle(
                        object:
                        controller.createdUser![index],
                      ),
                    );
                  },
                  itemCount: controller.createdUser?.length,
                ),
              ),
            ],
          )
              : const SizedBox.shrink(),
        ],
      );
    });
  }

  bool _sendColor() {
    for (int i = 0; i <= controller.localUser.length - 1; i++) {
      if (controller.localUser[i].isSelected) {
        return true;
      }
    }
    return false;
  }

}