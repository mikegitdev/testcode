import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tasker/inner/create_rostr/createRostr_controller.dart';

import '../../app_utils/app_color.dart';
import '../../app_utils/app_text_style.dart';
import '../component/custom_elevated_button.dart';
import '../component/custom_text_field.dart';
import 'back_button.dart';

class SingleTwoTextFieldBottomSheet extends GetView<CreateRostrController>{

  final String title;
  final String subTitle;
  final String hintTextName;
  final String hintTextComment;
  final TextEditingController textNameController;
  final TextEditingController textCommentController;
  final void Function() onTap;

  const SingleTwoTextFieldBottomSheet({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.hintTextName,
    required this.hintTextComment,
    required this.textNameController,
    required this.textCommentController,
    required this.onTap,
}):super(key: key);

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
                        subTitle,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.regularNormal.copyWith(fontSize: 12.sp, color: AppColor.c62677D, fontWeight: FontWeight.w400,),
                      ),
                      16.verticalSpace,
                      CustomTextField(
                        hintText: hintTextName,
                        textController: textNameController,
                      ),16.verticalSpace,
                      CustomTextField(
                        hintText: hintTextComment,
                        textController: textCommentController,
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