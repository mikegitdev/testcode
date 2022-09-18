import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:tasker/app_utils/app_color.dart';
import 'package:tasker/app_utils/app_text_style.dart';
import 'package:tasker/inner/component/custom_checkbox_list.dart';
import 'package:tasker/inner/component/custom_checkbox_list_remove.dart';

import '../../../rostr_info/inner_controller.dart';
import '../controllers/edit_alert_controller.dart';

class EditAlertView extends GetView<EditAlertController> {
  EditAlertView({Key? key}) : super(key: key);

  final emojis=Get.find<InnerController>().reserveEmojis;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("",
            style: AppTextStyle.boldNormal
                .copyWith(fontSize: 16.sp, color: Colors.black)),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 52,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Text(
              "Default Alerts",
              style: AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
            ),
          ),
          SizedBox(
            height: 46,
          ),
          for(int i=0; i<emojis.length; i++)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: CustomSwitchListTile(
                text: emojis[i].title!,
                value: emojis[i].isEnabled,
                onChanged: (value) {
                  print("${emojis.length}");
                  Get.find<InnerController>().enableEmoji(emojis[i]);
                  print("${emojis.length}");
                },
                activeColor: Colors.red,
                activeText: 'On',
                inactiveText: 'Off',
                activeTextColor: AppColor.white,
                inactiveTextColor: AppColor.c969696,
              ),
            ),
          // Column(
          //   children: [
          //     InkWell(
          //       onTap: () {},
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 24.w),
          //         child: CustomSwitchListTile(
          //           text: 'Love',
          //           value: true,
          //           onChanged: (value) {
          //             if(value){
          //             }
          //           },
          //           activeColor: Colors.red,
          //           activeText: 'On',
          //           inactiveText: 'Off',
          //           activeTextColor: AppColor.white,
          //           inactiveTextColor: AppColor.c969696,
          //         ),
          //       ),
          //     ),
          //     InkWell(
          //       onTap: () {},
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 24.w),
          //         child: CustomSwitchListTile(
          //           text: 'Hot',
          //           value: true,
          //           onChanged: (value) {},
          //           activeColor: Colors.red,
          //           activeText: 'On',
          //           inactiveText: 'Off',
          //           activeTextColor: AppColor.white,
          //           inactiveTextColor: AppColor.c969696,
          //         ),
          //       ),
          //     ),
          //     InkWell(
          //       onTap: () {},
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 24.w),
          //         child: CustomSwitchListTile(
          //           text: 'Date',
          //           value: true,
          //           onChanged: (value) {},
          //           activeColor: Colors.red,
          //           activeText: 'On',
          //           inactiveText: 'Off',
          //           activeTextColor: AppColor.white,
          //           inactiveTextColor: AppColor.c969696,
          //         ),
          //       ),
          //     ),
          //     InkWell(
          //       onTap: () {},
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 24.w),
          //         child: CustomSwitchListTile(
          //           text: 'Obsessed',
          //           value: true,
          //           onChanged: (value) {},
          //           activeColor: Colors.red,
          //           activeText: 'On',
          //           inactiveText: 'Off',
          //           activeTextColor: AppColor.white,
          //           inactiveTextColor: AppColor.c969696,
          //         ),
          //       ),
          //     ),
          //     InkWell(
          //       onTap: () {},
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 24.w),
          //         child: CustomSwitchListTile(
          //           text: 'F-boy',
          //           value: true,
          //           onChanged: (value) {},
          //           activeColor: Colors.red,
          //           activeText: 'On',
          //           inactiveText: 'Off',
          //           activeTextColor: AppColor.white,
          //           inactiveTextColor: AppColor.c969696,
          //         ),
          //       ),
          //     ),
          //     InkWell(
          //       onTap: () {},
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 24.w),
          //         child: CustomSwitchListTile(
          //           text: 'F-girl',
          //           value: true,
          //           onChanged: (value) {},
          //           activeColor: Colors.red,
          //           activeText: 'On',
          //           inactiveText: 'Off',
          //           activeTextColor: AppColor.white,
          //           inactiveTextColor: AppColor.c969696,
          //         ),
          //       ),
          //     ),
          //     InkWell(
          //       onTap: () {},
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 24.w),
          //         child: CustomSwitchListTile(
          //           text: 'Ick',
          //           value: true,
          //           onChanged: (value) {},
          //           activeColor: Colors.red,
          //           activeText: 'On',
          //           inactiveText: 'Off',
          //           activeTextColor: AppColor.white,
          //           inactiveTextColor: AppColor.c969696,
          //         ),
          //       ),
          //     ),
          //     InkWell(
          //       onTap: () {},
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 24.w),
          //         child: CustomSwitchListTile(
          //           text: 'Ghost',
          //           value: true,
          //           onChanged: (value) {},
          //           activeColor: Colors.red,
          //           activeText: 'On',
          //           inactiveText: 'Off',
          //           activeTextColor: AppColor.white,
          //           inactiveTextColor: AppColor.c969696,
          //         ),
          //       ),
          //     ),
          //     InkWell(
          //       onTap: () {},
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 24.w),
          //         child: CustomSwitchListTile(
          //           text: 'Added',
          //           value: true,
          //           onChanged: (value) {},
          //           activeColor: Colors.red,
          //           activeText: 'On',
          //           inactiveText: 'Off',
          //           activeTextColor: AppColor.white,
          //           inactiveTextColor: AppColor.c969696,
          //         ),
          //       ),
          //     ),
          //     InkWell(
          //       onTap: () {},
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 24.w),
          //         child: CustomSwitchListTile(
          //           text: 'Promoted',
          //           value: true,
          //           onChanged: (value) {},
          //           activeColor: Colors.red,
          //           activeText: 'On',
          //           inactiveText: 'Off',
          //           activeTextColor: AppColor.white,
          //           inactiveTextColor: AppColor.c969696,
          //         ),
          //       ),
          //     ),
          //     InkWell(
          //       onTap: () {},
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 24.w),
          //         child: CustomSwitchListTile(
          //           text: 'Demoted',
          //           value: true,
          //           onChanged: (value) {},
          //           activeColor: Colors.red,
          //           activeText: 'On',
          //           inactiveText: 'Off',
          //           activeTextColor: AppColor.white,
          //           inactiveTextColor: AppColor.c969696,
          //         ),
          //       ),
          //     ),
          //     InkWell(
          //       onTap: () {},
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 24.w),
          //         child: CustomSwitchListTile(
          //           text: 'Removed',
          //           value: true,
          //           onChanged: (value) {},
          //           activeColor: Colors.red,
          //           activeText: 'On',
          //           inactiveText: 'Off',
          //           activeTextColor: AppColor.white,
          //           inactiveTextColor: AppColor.c969696,
          //         ),
          //       ),
          //     ),
          //
          //     // ListTile(
          //     //   leading: Text("Love"),
          //     //   trailing: InkWell(
          //     //     onTap: () {},
          //     //     child: Padding(
          //     //       padding: EdgeInsets.symmetric(horizontal: 24.w),
          //     //       child: CustomCheckboxList(
          //     //         text: 'Turn this folder: ',
          //     //         value: true,
          //     //         onChanged: (value) {},
          //     //         activeColor: Colors.red,
          //     //         activeText: 'On',
          //     //         inactiveText: 'Off',
          //     //         activeTextColor: AppColor.white,
          //     //         inactiveTextColor: AppColor.c969696,
          //     //       ),
          //     //     ),
          //     //   ),
          //     //   //title: Text("List item $index")
          //     // ),
          //   ],
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Text(
              "Custom Alerts",
              style: AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: CustomCheckboxListRemove(
                text: 'Love',
                middleText: 'Remove',
                value: true,
                onChanged: (value) {},
                activeColor: Colors.red,
                activeText: 'On',
                inactiveText: 'Off',
                activeTextColor: AppColor.white,
                inactiveTextColor: AppColor.c969696,
              ),
            ),
          ),
          // Add Custom Alerts
          12.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Container(
              decoration: BoxDecoration(
                  gradient: AppColor.gradient_03,
                  borderRadius: BorderRadius.circular(12.r)),
              child: ElevatedButton(
                onPressed: () {}, //AppColor.gradient_03
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/add.svg',
                      height: 18.h,
                      color: Colors.white,
                    ),
                    8.horizontalSpace,
                    Text(
                      'Add Custom Alerts',
                      style: AppTextStyle.boldNormal
                          .copyWith(color: Colors.white, fontSize: 16.sp),
                    ),
                  ],
                ),
              ),
            ),
          ),
          12.verticalSpace,
        ],
      )),
    );
  }
}
