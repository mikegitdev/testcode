import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
    return GetBuilder<UserController>(
        builder: (ctr) {
          return Container(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    //#user image
                    Container(
                      width: 47.w,
                      height: 50.h,
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          child: Image.network(
                            object.image,
                            width: 55.w,
                            height: 55.h,
                          ),
                        ),
                      ),

                      //#borderRadius
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: object.isSelected ? Border.all(color: Colors.blue, width: 4): null,
                      ),
                    ),

                    //#galichka
                    object.isSelected ? Row(
                      //mainAxisAlignment: MainAxisAlignment.end,
                      //crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(Icons.check_circle_sharp, color: Colors.blue,),
                      ],
                    ) : Container(),

                    Container(
                      color: Colors.orange,
                    )
                  ],
                ),

                //#user name
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: 55.w,
                      child: Text(
                        object.name,
                        style: TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        }
    );
  }
}
