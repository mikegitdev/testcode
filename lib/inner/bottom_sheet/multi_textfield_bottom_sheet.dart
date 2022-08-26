import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tasker/app_utils/app_color.dart';
import 'package:tasker/app_utils/app_text_style.dart';
import 'package:tasker/inner/bottom_sheet/back_button.dart';
import 'package:tasker/inner/component/custom_elevated_button.dart';
import 'package:tasker/inner/component/custom_text_field.dart';
import 'package:tasker/inner/create_rostr/createRostr_controller.dart';

class MultiTextFieldBottomSheet extends GetView<CreateRostrController> {
  final String title;
  final String subtitle;
  final Function() onTap;
  final BottomSheetType type;

  const MultiTextFieldBottomSheet({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateRostrController>(builder: (ctr) {
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
                borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
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
                    style: AppTextStyle.boldNormal.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  12.verticalSpace,
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.regularNormal.copyWith(
                      fontSize: 12.sp,
                      color: AppColor.c62677D,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  16.verticalSpace,
                  type == BottomSheetType.CONTACT
                      ? Column(
                          children: [
                            CustomTextField(
                              hintText: 'Contact name e.g “Instagram”',
                              textController: controller.contactNameController,
                            ),
                            12.verticalSpace,
                            CustomTextField(
                              hintText: 'Link',
                              textController: controller.contactLinkController,
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            CustomTextField(
                              hintText: 'Date of event (MM/DD/YY)',
                              textController: controller.eventDateController,
                            ),
                            12.verticalSpace,
                            CustomTextField(
                              hintText: 'Heading - name',
                              textController: controller.eventHeadingController,
                            ),
                            12.verticalSpace,
                            CustomTextField(
                              hintText: 'Description',
                              textController:
                                  controller.eventDescriptionController,
                            ),
                          ],
                        ),
                  32.verticalSpace,
                  CustomElevatedButton(
                    title: 'Save',
                    hasGradient: true,
                    onPressed: () => onTap,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
