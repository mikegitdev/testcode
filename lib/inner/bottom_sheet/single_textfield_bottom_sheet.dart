import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tasker/app_utils/app_color.dart';
import 'package:tasker/app_utils/app_text_style.dart';
import 'package:tasker/inner/bottom_sheet/back_button.dart';
import 'package:tasker/inner/component/custom_elevated_button.dart';
import 'package:tasker/inner/component/custom_text_field.dart';
import 'package:tasker/inner/create_rostr/createRostr_controller.dart';
import 'package:tasker/inner/local_back.dart';

class SingleTextFieldBottomSheet extends GetView<CreateRostrController> {
  final String title;
  final String subtitle;
  final String hintText;
  final TextEditingController textController;
  final void Function() onTap;
  final bool chooseColor;

  const SingleTextFieldBottomSheet({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.hintText,
    required this.textController,
    required this.onTap,
    this.chooseColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateRostrController>(
      builder: (ctr) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomBackButton(),
              12.verticalSpace,
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(25.r)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 5.h,
                        width: 64.w,
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    24.verticalSpace,
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.boldNormal.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w700,),
                    ),
                    12.verticalSpace,
                    Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.regularNormal.copyWith(fontSize: 12.sp, color: AppColor.c62677D, fontWeight: FontWeight.w400,),
                    ),
                    16.verticalSpace,
                    CustomTextField(
                        hintText: hintText,
                        textController: textController,
                    ),
                    Visibility(
                      visible: chooseColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          20.verticalSpace,
                          Text(
                            'Choose tag color',
                            textAlign: TextAlign.start,
                            style: AppTextStyle.boldNormal.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w700),
                          ),
                          16.verticalSpace,
                          Row(
                            children: [
                              for(int i = 0; i < controller.tagColors.length; i++)
                                GestureDetector(
                                  onTap: () {
                                    controller.newTagColor = controller.tagColors[i];
                                  },
                                  child: Container(
                                    height: 32.h,
                                    width: 32.w,
                                    margin: EdgeInsets.only(right: 4.w),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(controller.tagColors[i]),
                                    ),
                                    child: Visibility(
                                      visible: controller.newTagColor == controller.tagColors[i],
                                      child: const Icon(Icons.check, color: AppColor.white, size: 12,),
                                    ),
                                  ),
                                )
                            ],
                          ),
                          16.verticalSpace,
                        ],
                      ),
                    ),
                    16.verticalSpace,
                    CustomElevatedButton(
                        title: 'Save',
                        hasGradient: true,
                        onPressed: onTap,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}