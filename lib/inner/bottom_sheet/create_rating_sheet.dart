import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasker/app_utils/app_color.dart';
import 'package:tasker/app_utils/app_text_style.dart';

import '../component/custom_elevated_button.dart';
import '../component/textfield_bottomsheet.dart';
import 'back_button.dart';

class CreateRatingBottomSheet extends StatelessWidget {
  const CreateRatingBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CustomBackButton(),
        12.verticalSpace,
        Container(
          padding: const EdgeInsets.only(left: 24,right: 24),
          height: 266,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.r),
                topRight: Radius.circular(32.r),
              )),
          child: Column(
            children: [
              12.verticalSpace,
              Container(
                height: 5.h,
                width: 64.w,
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius:
                    BorderRadius.circular(30)),
              ),
              24.verticalSpace,
              Text(
                "Create Rating",
                style:
                AppTextStyle.boldNormal.copyWith(
                  color: AppColor.c15213B,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
              12.verticalSpace,
              Text(
                "Please, input a name of a new rating categories",
                style:
                AppTextStyle.regularNormal.copyWith(
                  color: AppColor.c676F80,
                  fontWeight: FontWeight.w700,
                  fontSize: 12.sp,
                ),
              ),
              16.verticalSpace,
              TextFieldBottomSheet(hintText: "Rating", textEditingController: TextEditingController(),),
              36.verticalSpace,
              CustomElevatedButton(onPressed: (){}, child: const Text("Save",style: TextStyle(color: Colors.white),),),
              16.verticalSpace,
            ],
          ),
        ),
      ],
    );
  }
}
