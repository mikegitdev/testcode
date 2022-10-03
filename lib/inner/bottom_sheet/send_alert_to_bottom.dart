import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tasker/inner/bottom_sheet/back_button.dart';
import 'package:tasker/inner/rostr_info/user_controller.dart';

import '../../app_utils/app_color.dart';
import '../../app_utils/app_text_style.dart';
import '../../user_single.dart';

class SendAlertToBottom extends GetView<UserController> {
  const SendAlertToBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100.h,
                      height: 32.h,
                      decoration: BoxDecoration(
                          gradient: AppColor.gradient_03,
                          borderRadius: BorderRadius.circular(4.r)),
                      child: ElevatedButton(
                        onPressed: () {
                          // if (controller.selectedEmoji != null) {
                          //   controller.openBottomSheetSendAlert(
                          //       bottomSheet: const ShareAlertBottom());
                          // }
                        }, //AppColor.gradient_03
                        style: ElevatedButton.styleFrom(
                          //fixedSize: Size(120.h, 28.h),
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            'Direct',
                            style: AppTextStyle.boldNormal
                                .copyWith(color: Colors.white, fontSize: 12.sp),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Container(
                      width: 100.h,
                      height: 32.h,
                      decoration: BoxDecoration(
                          color: AppColor.cF9F9F9,
                          borderRadius: BorderRadius.circular(4.r)),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          //fixedSize: Size(120.h, 28.h),
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            'Groups',
                            style: AppTextStyle.boldNormal.copyWith(
                                color: AppColor.c676F80, fontSize: 12.sp),
                          ),
                        ),
                      ),
                    ),
                  ],
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
                                  controller
                                      .chooseUser(controller.localUser[index]);
                                });
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
                  ),
                ),
                _sendColor()
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: AppColor.gradient_03,
                                borderRadius: BorderRadius.circular(12.r)),
                            height: 40.h,
                            width: double.infinity,
                            child: Center(
                              child: Text("Send",
                                  style: AppTextStyle.boldNormal.copyWith(
                                      fontSize: 16.sp, color: AppColor.white)),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColor.cE2F1FD,
                              borderRadius: BorderRadius.circular(12.r)),
                          height: 40.h,
                          width: double.infinity,
                          child: Center(
                            child: Center(
                              child: Text("Send",
                                  style: AppTextStyle.boldNormal.copyWith(
                                      fontSize: 16.sp, color: AppColor.white)),
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

  bool _sendColor() {
    for (int i = 0; i <= controller.localUser.length - 1; i++) {
      if (controller.localUser[i].isSelected) {
        return true;
      }
    }
    return false;
  }
}



// class SendAlertToBottom extends GetView<UserController> {
//   const SendAlertToBottom({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return StatefulBuilder(builder: (context, update) {
//       return Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           const CustomBackButton(),
//           12.verticalSpace,
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(25.r),
//                 topRight: Radius.circular(25.r),
//               ),
//             ),
//             padding: EdgeInsets.only(top: 8.h),
//             //height: 400.h,
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   height: 5.h,
//                   width: 64.w,
//                   decoration: BoxDecoration(
//                       color: Colors.black54,
//                       borderRadius: BorderRadius.circular(30)),
//                 ),
//                 12.verticalSpace,
//                 Text(
//                   "Send Alert To",
//                   style: AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
//                 ),
//                 4.verticalSpace,
//                 Text(
//                   "Select chats",
//                   style: AppTextStyle.regularNormal
//                       .copyWith(fontSize: 12.sp, color: AppColor.c62677D),
//                 ),
//                 4.verticalSpace,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.zero,
//                         primary: const Color(0xffCFE8FB),
//                         fixedSize: Size(101.w, 32.h),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(
//                             7.0.r,
//                           ),
//                         ),
//                       ),
//                       child: Text('Direct',
//                           style: AppTextStyle.boldNormal.copyWith(
//                             fontSize: 16.sp,
//                             color: const Color(0xff41A3F0),
//                           )),
//                     ),
//                     SizedBox(
//                       width: 12.w,
//                     ),
//                     ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.zero,
//                         primary: const Color(0xffCFE8FB),
//                         fixedSize: Size(101.w, 32.h),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(
//                             7.0.r,
//                           ),
//                         ),
//                       ),
//                       child: Text('Groups',
//                           style: AppTextStyle.boldNormal.copyWith(
//                             fontSize: 16.sp,
//                             color: const Color(0xff41A3F0),
//                           )),
//                     ),
//                   ],
//                 ),
//                 20.verticalSpace,
//                 SizedBox(
//                   height: controller.isCreatedExist ? 450.h : 346.h,
//                   child: ListView(
//                     children: [
//                       Container(
//                         padding: EdgeInsets.symmetric(horizontal: 24.w),
//                         height: 350.h,
//                         child: GridView.builder(
//                           physics: controller.isCreatedExist
//                               ? const NeverScrollableScrollPhysics()
//                               : null,
//                           gridDelegate:
//                               const SliverGridDelegateWithFixedCrossAxisCount(
//                             // maxCrossAxisExtent: 110,
//                             // childAspectRatio: 3 / 2.14,
//                             // crossAxisSpacing: 6,
//                             // mainAxisSpacing: 10,
//                             crossAxisCount: 4,
//                           ),
//                           itemBuilder: (BuildContext ctx, index) {
//                             return GestureDetector(
//                               onTap: () {
//                                 update(() {
//                                   controller
//                                       .chooseUser(controller.localUser[index]);
//                                 });
//                               },
//                               child: UserSingle(
//                                 object: controller.localUser[index],
//                               ),
//                             );
//                           },
//                           itemCount: controller.localUser.length,
//                         ),
//                       ),
//                       controller.createdUser != null &&
//                               controller.createdUser!.isNotEmpty
//                           ? Column(
//                               children: [
//                                 24.verticalSpace,
//                                 Text(
//                                   "Custom Alerts",
//                                   style: AppTextStyle.boldNormal
//                                       .copyWith(fontSize: 18.sp),
//                                 ),
//                                 24.verticalSpace,
//                                 Container(
//                                   padding:
//                                       EdgeInsets.symmetric(horizontal: 24.w),
//                                   height: 200.h,
//                                   child: GridView.builder(
//                                     physics:
//                                         const NeverScrollableScrollPhysics(),
//                                     gridDelegate:
//                                         const SliverGridDelegateWithFixedCrossAxisCount(
//                                       //maxCrossAxisExtent: 100,
//                                       // childAspectRatio: 6 / 2.14,
//                                       crossAxisSpacing: 18,
//                                       // mainAxisSpacing: 6,
//                                       crossAxisCount: 4,
//                                       childAspectRatio: 1,
//                                     ),
//                                     itemBuilder: (BuildContext ctx, index) {
//                                       return GestureDetector(
//                                         onTap: () {
//                                           update(() {
//                                             controller.chooseUser(
//                                                 controller.createdUser![index]);
//                                           });
//                                         },
//                                         child: UserSingle(
//                                           object:
//                                               controller.createdUser![index],
//                                         ),
//                                       );
//                                     },
//                                     itemCount: controller.createdUser?.length,
//                                   ),
//                                 ),
//                               ],
//                             )
//                           : const SizedBox.shrink(),
//                     ],
//                   ),
//                 ),
//                 12.verticalSpace,
//                 // Padding(
//                 //   padding: EdgeInsets.symmetric(horizontal: 24.w),
//                 //   child: CustomElevatedButton(
//                 //     title: 'Send',
//                 //     //color: _sendColor() ? Colors.blue : Colors.white,
//                 //     onPressed: () {},
//                 //     hasGradient: true,
//                 //   ),
//                 // ),
//                 _sendColor()
//                     ? Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 24.w),
//                         child: GestureDetector(
//                           onTap: () {},
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 color: Colors.blue,
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(10))),
//                             height: 40.h,
//                             width: double.infinity,
//                             child: Center(
//                               child: Text(
//                                 "Send",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 25,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                         ),
//                       )
//                     : Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 24.w),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: Colors.blueGrey,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(10))),
//                           height: 40.h,
//                           width: double.infinity,
//                           child: Center(
//                             child: Text(
//                               "Send",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 25,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                       ),
//                 12.verticalSpace,
//               ],
//             ),
//           ),
//         ],
//       );
//     });
//   }

//   bool _sendColor() {
//     for (int i = 0; i <= controller.localUser.length - 1; i++) {
//       if (controller.localUser[i].isSelected) {
//         return true;
//       }
//     }
//     return false;
//   }
// }
