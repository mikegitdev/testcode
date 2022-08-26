import 'package:get/get.dart';
import 'package:tasker/appbar.dart';
import 'package:flutter/material.dart';
import 'package:tasker/emoji_text.dart';
import 'package:tasker/inner/bottom_sheet/multi_textfield_bottom_sheet.dart';
import 'package:tasker/inner/component/custom_elevated_button.dart';
import 'package:tasker/inner/component/custom_text_field.dart';
import 'package:tasker/inner/local_back.dart';
import 'package:tasker/app_utils/app_color.dart';
import 'package:tasker/app_utils/app_image.dart';
import 'package:tasker/app_utils/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasker/inner/create_rating/create_rating.dart';
import 'package:tasker/inner/component/custom_checkbox_list.dart';
import 'package:tasker/inner/create_rostr/createRostr_controller.dart';
import 'package:tasker/inner/bottom_sheet/single_textfield_bottom_sheet.dart';

class CreateRostr extends GetView<CreateRostrController> {
  const CreateRostr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0XffF5F5F5),
      appBar: AppBarScreen(
        appbarTitle: 'Create a rostr',
      ),
      body: GetBuilder<CreateRostrController>(builder: (ctrl) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(left: 24.w, right: 24.w),
          child: Column(
            children: [
              12.verticalSpace,
              Visibility(
                visible: controller.fileList.isNotEmpty,
                child: SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Center(
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.file(
                                controller.fileList[index],
                                height: 100.h,
                                width: 100.w,
                              ),
                            ),
                            const Align(
                              alignment: Alignment.bottomRight,
                              child: CircleAvatar(
                                backgroundColor: Color(0xffF5F5F5),
                                radius: 18,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.deleteIndex(index);
                              },
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  backgroundColor: const Color(0xff41A3F0),
                                  radius: 17,
                                  child: Image.asset(AppImage.close),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    itemCount: controller.fileList.length,
                  ),
                ),
              ),

              Visibility(
                visible: controller.fileList.isEmpty,
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Center(
                    child: Stack(
                      children: [
                        Image.asset(
                          AppImage.avatar2,
                          height: 100.h,
                          width: 100.w,
                        ),
                        const Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            backgroundColor: Color(0xffF5F5F5),
                            radius: 18,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.showPicker(context);
                          },
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              backgroundColor: const Color(0xff41A3F0),
                              radius: 17,
                              child: Image.asset(AppImage.camera),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              12.verticalSpace,
              controller.fileList.isEmpty
                  ? GestureDetector(
                      onTap: () {},
                      child: Text("Add A Photo",
                          style: AppTextStyle.boldNormal
                              .copyWith(fontSize: 18.sp)),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        controller.showPicker(context);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        padding: EdgeInsets.zero,
                        primary: const Color(0xffCFE8FB),
                        fixedSize: Size(193.w, 32.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            30.0.r,
                          ),
                        ),
                      ),
                      child: Text(
                        'Add additional photos',
                        style: AppTextStyle.boldNormal.copyWith(
                          fontSize: 16.sp,
                          color: const Color(0xff41A3F0),
                        ),
                      ),
                    ),

              16.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Personal Info",
                    style: AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
                  ),
                ],
              ),
              12.verticalSpace,
              CustomTextField(
                hintText: 'Name',
                textController: controller.personNameController,
              ),
              12.verticalSpace,
              CustomTextField(
                hintText: 'Date of birth (MM/DD/YYYY) / Age (XX)',
                textController: controller.personBirthDateController,
              ),
              12.verticalSpace,
              CustomTextField(
                hintText: 'Where we met',
                textController: controller.personPlaceController,
              ),

              16.verticalSpace,
              CustomSwitchListTile(
                activeText: 'On',
                inactiveText: 'Off',
                text: 'Enable ratings',
                activeColor: Colors.red,
                activeTextColor: AppColor.white,
                inactiveTextColor: AppColor.c969696,
                value: controller.enableRating,
                onChanged: (value) {
                  controller.changeRating(value);
                },
              ),

              controller.enableRating
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Ratings",
                              style: AppTextStyle.boldNormal
                                  .copyWith(fontSize: 18.sp),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CreateRating(),
                                  ),
                                );
                              },
                              child: Text(
                                "Edit",
                                style: AppTextStyle.boldNormal.copyWith(
                                    fontSize: 16.sp, color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                        16.verticalSpace,
                        Padding(
                          padding: EdgeInsets.only(bottom: 24.h),
                          child: Container(
                            height: 38.h,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Overall Rating",
                                  style: AppTextStyle.boldNormal
                                      .copyWith(fontSize: 16.sp),
                                ),
                                Wrap(
                                  alignment: WrapAlignment.start,
                                  children: [
                                    Text(
                                      "- - ",
                                      style: AppTextStyle.boldNormal.copyWith(
                                        fontSize: 16.sp,
                                        color: const Color(0xff00AE26),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.grade,
                                      color: Colors.amber,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50.h * controller.ratingsColumnNumber,
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 12.h,
                              crossAxisSpacing: 12.w,
                              childAspectRatio: 4,
                            ),
                            itemCount: ratings.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: AppColor.white,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      ratings[index].title,
                                      style: AppTextStyle.regularNormal
                                          .copyWith(
                                              fontSize: 16.sp,
                                              color: AppColor.c15213B),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_outlined,
                                      color: AppColor.c15213B,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        24.verticalSpace,

                        CustomElevatedButton(
                          title: 'Add Rating',
                          hasGradient: false,
                          onPressed: () {
                            controller.openBottomSheet(
                              SingleTextFieldBottomSheet(
                                title: 'Create a Rating',
                                subtitle:
                                'Please, input a name of a new rating categorie',
                                hintText: 'Rating name',
                                textController: controller.ratingNameController,
                                onTap: () {},
                              ),
                            );
                          },
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
              12.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tags",
                    style: AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Edit",
                      style: AppTextStyle.boldNormal
                          .copyWith(fontSize: 16.sp, color: Colors.red),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                    spacing: 12.0,
                    runSpacing: 8.0,
                    children: List.generate(
                      tags.length,
                      (index) => Container(
                        padding: EdgeInsets.all(8.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.h),
                          color: Colors.white,
                        ),
                        child: Text(
                          tags[index].title,
                          style: AppTextStyle.regularNormal.copyWith(
                            fontSize: 14.sp,
                            color: tags[index].color,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    )),
              ),
              20.verticalSpace,
              CustomElevatedButton(
                title: 'Add Tag',
                hasGradient: false,
                onPressed: () {
                  controller.openBottomSheet(
                    SingleTextFieldBottomSheet(
                      title: 'Create a Tag',
                      subtitle:
                      'Please, input a name of a new tag and choose a color',
                      hintText: 'Tag name',
                      textController: controller.tagNameController,
                      chooseColor: true,
                      onTap: () {},
                    ),
                  );
                },
              ),
              16.verticalSpace,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Notes",
                    style: AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Edit",
                      style: AppTextStyle.boldNormal
                          .copyWith(fontSize: 16.sp, color: Colors.red),
                    ),
                  ),
                ],
              ),
              16.verticalSpace,
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 24.h),
                padding: EdgeInsets.all(8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("General Notes",
                        style:
                            AppTextStyle.boldNormal.copyWith(fontSize: 16.sp)),
                    Text("Write some general notes about this person",
                        style: AppTextStyle.regularNormal
                            .copyWith(fontSize: 16.sp, height: 1.6)),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 24.h),
                padding: EdgeInsets.all(8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Likes ',
                            style: AppTextStyle.boldNormal
                                .copyWith(fontSize: 16.sp)),
                        EmojiText(
                          text: '👍',
                          size: 21.h,
                        ),
                      ],
                    ),
                    Text("Write things that this person likes",
                        style: AppTextStyle.regularNormal
                            .copyWith(fontSize: 16.sp, height: 1.6)),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom: 24.h),
                padding: EdgeInsets.all(8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Dislikes",
                            style: AppTextStyle.boldNormal
                                .copyWith(fontSize: 16.sp)),
                        EmojiText(
                          text: '👎',
                          size: 21.h,
                        ),
                      ],
                    ),
                    Text("Write things that this person dislikes",
                        style: AppTextStyle.regularNormal
                            .copyWith(fontSize: 16.sp, height: 1.6)),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom: 24.h),
                padding: EdgeInsets.all(8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Pros" ' ',
                            style: AppTextStyle.boldNormal
                                .copyWith(fontSize: 16.sp)),
                        EmojiText(
                          text: '🟢',
                          size: 16.h,
                        ),
                      ],
                    ),
                    Text("Write things that YOU like about this person",
                        style: AppTextStyle.regularNormal
                            .copyWith(fontSize: 16.sp, height: 1.6)),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom: 24.h),
                padding: EdgeInsets.all(8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Cons ',
                            style: AppTextStyle.boldNormal
                                .copyWith(fontSize: 16.sp)),
                        EmojiText(
                          text: '🔴',
                          size: 16.h,
                        ),
                      ],
                    ),
                    Text("Write things that you consider drawbacks / red flags",
                        style: AppTextStyle.regularNormal
                            .copyWith(fontSize: 16.sp, height: 1.6)),
                  ],
                ),
              ),
              CustomElevatedButton(
                title: 'Add Note',
                hasGradient: false,
                onPressed: () {
                  controller.openBottomSheet(
                    SingleTextFieldBottomSheet(
                      title: 'Create a Note',
                      subtitle: 'Please, input a name of a new note block',
                      hintText: 'Notes name',
                      textController: controller.noteNameController,
                      onTap: () {},
                    ),
                  );
                },
              ),

              12.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Contacts",
                    style: AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Edit",
                      style: AppTextStyle.boldNormal
                          .copyWith(fontSize: 16.sp, color: Colors.red),
                    ),
                  ),
                ],
              ),
              12.verticalSpace,
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom: 24.h),
                padding: EdgeInsets.all(8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Phone Number",
                        style:
                            AppTextStyle.boldNormal.copyWith(fontSize: 16.sp)),
                    Text(
                      "Add phone number or other contacts",
                      style: AppTextStyle.regularNormal.copyWith(
                          fontSize: 16.sp, height: 1.6, color: Colors.blue),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                  bottom: 24.h,
                ),
                padding: EdgeInsets.all(8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Snapchat",
                        style:
                            AppTextStyle.boldNormal.copyWith(fontSize: 16.sp)),
                    Text(
                      "Add a username",
                      style: AppTextStyle.regularNormal.copyWith(
                          fontSize: 16.sp, height: 1.6, color: Colors.blue),
                    ),
                  ],
                ),
              ),
              CustomElevatedButton(
                title: 'Add Contact',
                hasGradient: false,
                onPressed: () {
                  controller.openBottomSheet(
                      MultiTextFieldBottomSheet(
                        title: 'Create a Contact',
                        subtitle: 'Please, input a name of a new contact and a link',
                        type: BottomSheetType.CONTACT,
                        onTap: (){},
                      )
                  );
                },
              ),
              16.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dates",
                    style: AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Edit",
                      style: AppTextStyle.boldNormal
                          .copyWith(fontSize: 16.sp, color: Colors.red),
                    ),
                  ),
                ],
              ),
              12.verticalSpace,
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) => Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(
                    bottom: 24.h,
                  ),
                  padding: EdgeInsets.all(8.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Event",
                              style: AppTextStyle.boldNormal
                                  .copyWith(fontSize: 16.sp)),
                          Text("01/01/21",
                              style: AppTextStyle.boldNormal
                                  .copyWith(fontSize: 16.sp)),
                        ],
                      ),
                      Text(
                        "This section allows you to add events that take place between you and this person, such as a first kiss, dates, and other events. Created events will also be saved to your calendar in the Rostr Tools section. ",
                        style: AppTextStyle.regularNormal
                            .copyWith(fontSize: 16.sp, height: 1.6),
                      ),
                    ],
                  ),
                ),
              ),

              CustomElevatedButton(
                title: 'Add Date',
                hasGradient: false,
                onPressed: (){
                  controller.openBottomSheet(
                      MultiTextFieldBottomSheet(
                        title: 'Create a Date',
                        subtitle: 'Please, input a date, heading and description of the event ',
                        type: BottomSheetType.EVENT_DATE,
                        onTap: (){},
                      )
                  );
                },
              ),
              16.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Position",
                    style: AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Edit",
                      style: AppTextStyle.boldNormal
                          .copyWith(fontSize: 16.sp, color: Colors.red),
                    ),
                  ),
                ],
              ),
              12.verticalSpace,
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  color: AppColor.cF6FAFE,
                  borderRadius: BorderRadius.all(Radius.circular(12.r)),
                ),
                child: DropdownButton<String>(
                    underline: const SizedBox(),
                    value: 'Choose a rostr type',
                    isDense: true,
                    isExpanded: true,
                    items: controller.sectionItems.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (value) {}),
              ),
              12.verticalSpace,
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  color: AppColor.cF6FAFE,
                  borderRadius: BorderRadius.all(Radius.circular(12.r)),
                ),
                child: DropdownButton<String>(
                    underline: const SizedBox(),
                    value: 'Choose a folder',
                    isDense: true,
                    isExpanded: true,
                    items: controller.folderItems.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (value) {}),
              ),
              12.verticalSpace,
              CustomElevatedButton(
                  title: 'Create',
                  hasGradient: true,
                  onPressed: (){},
              ),
              // add padding s from here
              100.verticalSpace,
              //Here
            ],
          ),
        );
      }),
    );
  }
}
