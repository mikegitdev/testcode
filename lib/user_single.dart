import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tasker/app_utils/app_image.dart';
import 'package:tasker/inner/rostr_info/user_controller.dart';

import 'app_utils/app_color.dart';
import 'data/models/user_model.dart';

class UserSingle extends GetView<UserController> {
  final UserModel object;

  UserSingle({
    Key? key,
    required this.object,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (ctr) {
      return Container(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: object.isSelected ? 54.h : 50.h,
                  height: object.isSelected ? 54.h : 50.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: object.isSelected
                        ? Border.all(color: Colors.blue, width: 4.h)
                        : null,
                  ),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: object.isSelected
                          ? BorderRadius.all(Radius.circular(5))
                          : BorderRadius.all(Radius.circular(10)),
                      child: Image.network(
                        object.image,
                        width: 50.h,
                        height: 50.h,
                      ),
                    ),
                  ),
                ),
                object.isSelected
                    ? Image.asset(
                        AppImage.check,
                        width: 19.h,
                        height: 19.h,
                      )
                    : SizedBox.shrink(),
              ],
            ),
            //#user name
            Text(
              object.name,
              textAlign: TextAlign.center,
              style: TextStyle(overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      );
    });
  }
}
