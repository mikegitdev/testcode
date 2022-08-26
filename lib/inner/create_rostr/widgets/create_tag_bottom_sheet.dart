import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasker/app_utils/app_color.dart';
import 'package:tasker/app_utils/app_text_style.dart';
import 'package:tasker/inner/bottom_sheet/back_button.dart';
import 'package:tasker/inner/component/custom_elevated_button.dart';
import 'package:tasker/inner/component/textfield_bottomsheet.dart';
import 'package:tasker/inner/create_rostr/createRostr_controller.dart';

class CreateTagBottomSheet extends StatelessWidget {
  final CreateRostrController createRostrController;

  const CreateTagBottomSheet({Key? key, required this.createRostrController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CustomBackButton(),
          12.verticalSpace,
          Container(
            padding: const EdgeInsets.only(left: 24, right: 24),
            height: 350,
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
                      borderRadius: BorderRadius.circular(30)),
                ),
                24.verticalSpace,
                Text(
                  "Create Tag",
                  style: AppTextStyle.boldNormal.copyWith(
                    color: AppColor.c15213B,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
                12.verticalSpace,
                Text(
                  "Please, input a name of a new tag and choose a color",
                  style: AppTextStyle.regularNormal.copyWith(
                    color: AppColor.c676F80,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                ),
                16.verticalSpace,
                TextFieldBottomSheet(
                  hintText: "Tag",
                  textEditingController:
                      createRostrController.tagController,
                ),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Choose tag color", style: AppTextStyle.semiBoldNormal.copyWith(
                      color: AppColor.c15213B,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),),
                  ],
                ),
                16.verticalSpace,
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: createRostrController.listColor.length,
                    itemBuilder: (context, index) =>  InkWell(
                      onTap: (){
                        createRostrController.chooseIndex(index);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: createRostrController.listColor[index],
                          child: createRostrController.selectedIndex == index  ? Icon(Icons.check,size: 10,color: Colors.white,) : SizedBox.shrink(),
                        ),
                      ),
                    ),
                  ),
                ),

                32.verticalSpace,
                CustomElevatedButton(
                  onPressed: () {
                    createRostrController.createTagFunction();
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                2.verticalSpace
              ],
            ),
          ),
        ],
      ),
    );
  }
}
