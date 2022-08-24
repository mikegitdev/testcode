import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tasker/app_utils/app_color.dart';
import 'package:tasker/app_utils/app_text_style.dart';
import 'package:tasker/emoji.dart';
import 'package:tasker/inner/bottom_sheet/back_button.dart';

import '../local_back.dart';

class CreateAlertBottom extends StatelessWidget {
  const CreateAlertBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
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
            padding: EdgeInsets.only(top: 8.h),
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
                12.verticalSpace,
                Text(
                  "Create Alert",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.boldNormal.copyWith(fontSize: 16.sp),
                ),
                12.verticalSpace,
                Text(
                  "Please, choose an emoji and type in an alert name",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.regularNormal
                      .copyWith(fontSize: 12.sp, color: AppColor.c62677D),
                ),
                12.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(left: 24.w),
                  child: Text(
                    "Choose an Emoji",
                    style: AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
                  ),
                ),
                12.verticalSpace,
                SizedBox(
                  height: 300.h,
                  child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 40,
                      childAspectRatio: 3 / 2.5,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 12,
                    ),
                    itemBuilder: (BuildContext ctx, index) {
                      return Emoji(
                        emojiName: emojis[index],
                      );
                    },
                    itemCount: emojis.length,
                  ),
                ),
                30.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(left: 24.w),
                  child: Text(
                    "Make up a Name",
                    style: AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
                  ),
                ),
                14.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(
                      left: 24.w,
                      right: 24.w,
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: TextFormField(
                    style: AppTextStyle.regularNormal.copyWith(
                      color: AppColor.c15213B,
                      fontSize: 16.sp,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                      fillColor: AppColor.cF6FAFE,
                      filled: true,
                      hintText: "e.g. Handsome",
                      labelStyle: AppTextStyle.regularNormal.copyWith(
                        color: AppColor.c969BA7,
                        fontSize: 12.sp,
                        height: 2.h,
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 0, style: BorderStyle.none),
                        borderRadius: BorderRadius.all(Radius.circular(12.r)),
                      ),
                    ),
                  ),
                ),
                20.verticalSpace,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                  decoration: BoxDecoration(
                      gradient: AppColor.gradient_03,
                      borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: ElevatedButton(
                      onPressed: () {}, //AppColor.gradient_03
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent,
                        fixedSize: Size.fromHeight(48.h)
                      ),
                      child: Center(
                        child: Text(
                          'Continue',
                          style: AppTextStyle.boldNormal
                              .copyWith(color: Colors.white, fontSize: 16.sp),
                        ),
                      )
                  ),
                ),
                20.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
