import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tasker/app_utils/app_color.dart';
import 'package:tasker/app_utils/app_image.dart';
import 'package:tasker/app_utils/app_text_style.dart';
import 'package:tasker/appbar.dart';
import 'package:tasker/emoji_text.dart';
import 'package:tasker/inner/bottom_sheet/back_button.dart';
import 'package:tasker/inner/bottom_sheet/create_rating_sheet.dart';
import 'package:tasker/inner/bottom_sheet/send_tochat_bottom.dart';
import 'package:tasker/inner/bottom_sheet/share_alert_bottom.dart';
import 'package:tasker/inner/component/custom_checkbox_list.dart';
import 'package:tasker/inner/component/custom_elevated_button.dart';
import 'package:tasker/inner/component/custom_text_field.dart';
import 'package:tasker/inner/component/textfield_bottomsheet.dart';
import 'package:tasker/inner/create_rating/create_rating.dart';
import 'package:tasker/inner/create_rostr/createRostr_controller.dart';
import 'package:tasker/inner/create_rostr/widgets/create_data_bottom_sheet.dart';
import 'package:tasker/inner/create_rostr/widgets/create_tag_bottom_sheet.dart';
import 'package:tasker/inner/create_rostr/widgets/elevated_buttons.dart';
import 'package:tasker/inner/local_back.dart';

import 'widgets/create_note_bottom_sheet.dart';

class CreateRostr extends GetView<CreateRostrController> {
  CreateRostr({Key? key}) : super(key: key);
  final CreateRostrController createRostrController =
      Get.put(CreateRostrController());
  final String sectionValue = 'Choose a rostr type';

  // List of items in our dropdown menu
  final List<String> sectionItems = [
    'Choose a rostr type',
    'Dating',
    'Friends',
    'Professional',
  ];

  final String folderValue = 'Choose a folder';

  // List of items in our dropdown menu
  final List<String> folderItems = [
    'Choose a folder',
    'Starting Lineup',
    'Reserves',
  ];

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
                visible: createRostrController.fileList.isNotEmpty,
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
                                createRostrController.fileList[index],
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
                                createRostrController.deleteIndex(index);
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
                    itemCount: createRostrController.fileList.length,
                  ),
                ),
              ),

              Visibility(
                visible: createRostrController.fileList.isEmpty,
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
                            createRostrController.showPicker(context);
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
              createRostrController.fileList.isEmpty
                  ? GestureDetector(
                      onTap: () {},
                      child: Text("Add A Photo",
                          style: AppTextStyle.boldNormal
                              .copyWith(fontSize: 18.sp)),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        createRostrController.showPicker(context);
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
              TextFormField(
                style: AppTextStyle.regularNormal.copyWith(
                  color: AppColor.c15213B,
                  fontSize: 16.sp,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                  fillColor: AppColor.cF6FAFE,
                  filled: true,
                  // helperText: "Name",
                  hintText: "Name",
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  alignLabelWithHint: false,
                  floatingLabelStyle: AppTextStyle.regularNormal.copyWith(
                    fontSize: 16.sp,
                    color: AppColor.c969BA7,
                  ),
                  // hintText: "e.g. Handsome",
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
              12.verticalSpace,
              TextFormField(
                style: AppTextStyle.regularNormal.copyWith(
                  color: AppColor.c15213B,
                  fontSize: 16.sp,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                  fillColor: AppColor.cF6FAFE,
                  filled: true,
                  // helperText: "Name",
                  hintText: "Date of birth (MM/DD/YYYY) / Age (XX)",
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  alignLabelWithHint: false,
                  floatingLabelStyle: AppTextStyle.regularNormal.copyWith(
                    fontSize: 16.sp,
                    color: AppColor.c969BA7,
                  ),
                  // hintText: "e.g. Handsome",
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
              12.verticalSpace,
              TextFormField(
                style: AppTextStyle.regularNormal.copyWith(
                  color: AppColor.c15213B,
                  fontSize: 16.sp,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                  fillColor: AppColor.cF6FAFE,
                  filled: true,
                  // helperText: "Name",
                  hintText: "Where we met",
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  alignLabelWithHint: false,
                  floatingLabelStyle: AppTextStyle.regularNormal.copyWith(
                    fontSize: 16.sp,
                    color: AppColor.c969BA7,
                  ),
                  // hintText: "e.g. Handsome",
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

              16.verticalSpace,
              InkWell(
                onTap: () {},
                child: CustomCheckboxList(
                  text: 'Enable ratings',
                  value: createRostrController.enableRating,
                  onChanged: (value) {
                    createRostrController.changeRating(value);
                  },
                  activeColor: Colors.red,
                  activeText: 'On',
                  inactiveText: 'Off',
                  activeTextColor: AppColor.white,
                  inactiveTextColor: AppColor.c969696,
                ),
              ),

              createRostrController.enableRating == true
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
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  " " "Overall Rating",
                                  style: AppTextStyle.boldNormal
                                      .copyWith(fontSize: 16.sp),
                                ),
                                Wrap(
                                  alignment: WrapAlignment.start,
                                  children: [
                                    Text(
                                      "- -" " ",
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

                        ///................................................................
                        // SizedBox(
                        //   height: 80.h,
                        //   width: double.infinity,
                        //   child: GridView.builder(
                        //     shrinkWrap: true,
                        //     scrollDirection: Axis.horizontal,
                        //     padding: EdgeInsets.symmetric(horizontal: 24.w),
                        //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        //       maxCrossAxisExtent: 60,
                        //       childAspectRatio: 0.4/ 2,
                        //       crossAxisSpacing: 8.h,
                        //       mainAxisSpacing: 20.w,
                        //     ),
                        //     itemBuilder: (BuildContext ctx, index) {
                        //       return ElevatedButton(
                        //         onPressed: () {},
                        //         style: ElevatedButton.styleFrom(
                        //             shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(8),
                        //             ),
                        //             primary: AppColor.white,
                        //             shadowColor: Colors.transparent,
                        //             fixedSize: Size(157.w,37.h)),
                        //         child: Row(
                        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //           children: [
                        //             Text(
                        //               'Looks',
                        //               style: AppTextStyle.boldNormal.copyWith(
                        //                   color: AppColor.c15213B, fontSize: 16.sp),
                        //             ),
                        //             const Icon(Icons.arrow_forward_outlined,color: Colors.black,)
                        //           ],
                        //         ),
                        //       );
                        //     },
                        //     itemCount: emojisSet.length,
                        //   ),
                        // ),

                        Padding(
                          padding: EdgeInsets.only(bottom: 24.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: List.generate(
                                  ratings.length - ratings.length ~/ 2,
                                  (index) => Padding(
                                    padding: EdgeInsets.only(bottom: 12.0.h),
                                    child: Container(
                                      height: 38.h,
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          30.h,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            " ${ratings[ratings.length ~/ 2 + index].ratingTitle}",
                                            style: AppTextStyle.regularNormal
                                                .copyWith(
                                                    fontSize: 16.sp,
                                                    color: AppColor.c15213B),
                                          ),
                                          const Icon(
                                            Icons.arrow_forward_outlined,
                                            color: AppColor.c15213B,
                                          ),
                                          // Wrap(
                                          //   alignment: WrapAlignment.start,
                                          //   children: [
                                          //     Text(
                                          //       "${ratings[ratings.length ~/ 2 + index].ratingScore} ",
                                          //       style: AppTextStyle.boldNormal
                                          //           .copyWith(
                                          //         fontSize: 16.sp,
                                          //         color:
                                          //             const Color(0xff00AE26),
                                          //       ),
                                          //     ),
                                          //     const Icon(
                                          //       Icons.grade,
                                          //       color: Colors.amber,
                                          //     ),
                                          //   ],
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                children: List.generate(
                                  ratings.length ~/ 2,
                                  (index) => Padding(
                                    padding: EdgeInsets.only(bottom: 12.0.h),
                                    child: Container(
                                      height: 38.h,
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          30.h,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8.r)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            " ${ratings[index].ratingTitle}",
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
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.bottomSheet(
                              isDismissible: false,
                              // Dismiss when anywhere except the sheet pressed
                              isScrollControlled: true,
                              const CreateRatingBottomSheet(),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              primary: AppColor.cCFE8FB,
                              shadowColor: Colors.transparent,
                              fixedSize: Size.fromHeight(40.h)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/add.svg',
                                height: 18.h,
                                color: const Color(0xff41A3F0),
                              ),
                              5.horizontalSpace,
                              Text(
                                'Add Rating',
                                style: AppTextStyle.boldNormal.copyWith(
                                    color: const Color(0xff41A3F0),
                                    fontSize: 16.sp),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(
                      height: 12,
                    ),

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
              Visibility(
                visible: tags.isNotEmpty,
                child: SizedBox(
                  height: 60.h,
                  width: MediaQuery.of(context).size.width - 48.h,
                  child: Wrap(
                      children: List.generate(
                        tags.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: 12.h, bottom: 12.h),
                      child: Container(
                        padding: EdgeInsets.all(8.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.h),
                          color: Colors.white,
                        ),
                        child: Text(tags[index].lookTitle,
                            style: AppTextStyle.regularNormal.copyWith(
                                fontSize: 14.sp, color: tags[index].lookColor)),
                      ),
                    ),
                  )),
                ),
              ),
              80.verticalSpace,
              CreateRostrElevatedButton(
                buttonText: 'Add Tag',
                bottomSheet: CreateTagBottomSheet(
                  createRostrController: createRostrController,
                ),
                createRostrController: createRostrController,
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
              Visibility(
                visible: createRostrController.createNoteList.isNotEmpty,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 8,
                      ),
                      height: 66,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                              createRostrController
                                  .createNoteList[index].noteTitle,
                              style: AppTextStyle.boldNormal
                                  .copyWith(fontSize: 16.sp)),
                          Text(
                              createRostrController
                                  .createNoteList[index].noteSubtitle,
                              style: AppTextStyle.regularNormal
                                  .copyWith(fontSize: 16.sp, height: 1.6)),
                        ],
                      ),
                    ),
                  ),
                  itemCount: createRostrController.createNoteList.length,
                ),
              ),

              12.verticalSpace,
              CreateRostrElevatedButton(
                buttonText: 'Add Note',
                bottomSheet: CreateNoteBottomSheet(
                  createRostrController: createRostrController,
                ),
                createRostrController: createRostrController,
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
              SizedBox(
                height: 40.h,
                width: MediaQuery.of(context).size.width,
                child: OutlinedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    primary: const Color(0xffCFE8FB),
                    //  fixedSize: Size(101.w, 32.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        12.0.r,
                      ),
                    ),
                    side: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  child: Wrap(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/add.svg',
                        height: 18.h,
                        color: Color(0xff41A3F0),
                      ),
                      Text(
                        ' ' 'Add Contact',
                        style: AppTextStyle.boldNormal.copyWith(
                          fontSize: 16.sp,
                          color: Color(0xff41A3F0),
                        ),
                      ),
                    ],
                  ),
                ),
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
              ListView.builder(shrinkWrap:true,itemCount: 3,itemBuilder: (context,index) => Container(
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
              ),),

              CreateRostrElevatedButton(buttonText: "Add Date", bottomSheet: CreateDataBottomSheet(createRostrController: createRostrController,), createRostrController: createRostrController),
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
                    value: sectionValue,
                    isDense: true,
                    isExpanded: true,
                    items: sectionItems.map((String items) {
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
                    value: folderValue,
                    isDense: true,
                    isExpanded: true,
                    items: folderItems.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (value) {}),
              ),
              12.verticalSpace,
              Container(
                decoration: BoxDecoration(
                    gradient: AppColor.gradient_03,
                    borderRadius: BorderRadius.circular(12.r)),
                child: ElevatedButton(
                  onPressed: () {
                    // showModalBottomSheet(
                    //     context: context,
                    //     isScrollControlled: true,
                    //     backgroundColor: Colors.transparent,
                    //     builder: (context) {
                    //       return ShareAlertBottom();
                    //     });
                  }, //AppColor.gradient_03
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      8.horizontalSpace,
                      Text(
                        'Create',
                        style: AppTextStyle.boldNormal
                            .copyWith(color: Colors.white, fontSize: 16.sp),
                      ),
                    ],
                  ),
                ),
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
