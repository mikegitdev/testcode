import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tasker/app_color.dart';
import 'package:tasker/app_image.dart';
import 'package:tasker/app_text_style.dart';
import 'package:tasker/appbar.dart';
import 'package:tasker/emoji_text.dart';
import 'package:tasker/inner/component/custom_checkbox_list.dart';
import 'package:tasker/inner/create_rostr/createRostr_controller.dart';
import 'package:tasker/inner/local_back.dart';

class CreateRostr extends GetView {
  final CreateRostrController createRostrController =
      Get.put(CreateRostrController());
  String sectionValue = 'Choose a rostr type';

  // List of items in our dropdown menu
  var sectionItems = [
    'Choose a rostr type',
    'Dating',
    'Friends',
    'Professional',
  ];

  String folderValue = 'Choose a folder';

  // List of items in our dropdown menu
  var folderItems = [
    'Choose a folder',
    'Starting Lineup',
    'Reserves',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0XffF5F5F5),
      appBar: AppBarScreen(
        appbarTitle: 'Create a rostr',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            12.verticalSpace,
            Image.asset(
              AppImage.avatar2,
              height: 96.h,
              width: 96.h,
            ),

            12.verticalSpace,
            Text(
              "Add A Photo",
              style: AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
            ),

            16.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Personal Info",
                    style: AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
                  ),
                  1.verticalSpace,
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 24.0.w,
                right: 24.0.w,
                // bottom: MediaQuery.of(context).viewInsets.bottom,
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
                  // helperText: "Name",
                  labelText: "Name",
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
                    borderSide: BorderSide(width: 0, style: BorderStyle.none),
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                  ),
                ),
              ),
            ),
            12.verticalSpace,
            Padding(
              padding: EdgeInsets.only(
                left: 24.0.w,
                right: 24.0.w,
                // bottom: MediaQuery.of(context).viewInsets.bottom,
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
                  // helperText: "Name",
                  labelText: "Date of birth (MM/DD/YYYY) / Age (XX)",
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
                    borderSide: BorderSide(width: 0, style: BorderStyle.none),
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                  ),
                ),
              ),
            ),
            12.verticalSpace,
            Padding(
              padding: EdgeInsets.only(
                left: 24.0.w,
                right: 24.0.w,

                // bottom: MediaQuery.of(context).viewInsets.bottom,
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
                  // helperText: "Name",
                  labelText: "Where we met",
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
                    borderSide: BorderSide(width: 0, style: BorderStyle.none),
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                  ),
                ),
              ),
            ),

            16.verticalSpace,
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: CustomCheckboxList(
                  text: 'Enable ratings',
                  value: false,
                  onChanged: (value) {
                    createRostrController.changeRating();
                    debugPrint(createRostrController.enableRating.toString());
                  },
                  activeColor: Colors.red,
                  activeText: 'On',
                  inactiveText: 'Off',
                  activeTextColor: AppColor.white,
                  inactiveTextColor: AppColor.c969696,
                ),
              ),
            ),

            Obx(() => createRostrController.enableRating == true
                ? Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Ratings",
                              style: AppTextStyle.boldNormal
                                  .copyWith(fontSize: 18.sp),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Edit",
                                style: AppTextStyle.boldNormal.copyWith(
                                    fontSize: 16.sp, color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ),
                      16.verticalSpace,
                      Padding(
                        padding: EdgeInsets.only(
                            left: 24.h, right: 24.h, bottom: 24.h),
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
                                      color: Color(0xff00AE26),
                                    ),
                                  ),
                                  Icon(
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
                      Padding(
                        padding: EdgeInsets.only(
                            left: 24.h, right: 24.h, bottom: 24.h),
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
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
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
                                          " ${ratings[ratings.length ~/ 2 + index].ratingTitle}",
                                          style: AppTextStyle.regularNormal
                                              .copyWith(fontSize: 16.sp),
                                        ),
                                        Wrap(
                                          alignment: WrapAlignment.start,
                                          children: [
                                            Text(
                                              "${ratings[ratings.length ~/ 2 + index].ratingScore} ",
                                              style: AppTextStyle.boldNormal
                                                  .copyWith(
                                                fontSize: 16.sp,
                                                color: Color(0xff00AE26),
                                              ),
                                            ),
                                            Icon(
                                              Icons.grade,
                                              color: Colors.amber,
                                            ),
                                          ],
                                        ),
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
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
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
                                              .copyWith(fontSize: 16.sp),
                                        ),
                                        Wrap(
                                          alignment: WrapAlignment.start,
                                          children: [
                                            Text(
                                              "${ratings[index].ratingScore} ",
                                              style: AppTextStyle.boldNormal
                                                  .copyWith(
                                                fontSize: 16.sp,
                                                color: Color(0xff00AE26),
                                              ),
                                            ),
                                            Icon(
                                              Icons.grade,
                                              color: Colors.amber,
                                            ),
                                          ],
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
                    ],
                  )
                : 1.verticalSpace),

            // : 1.verticalSpace,

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: Row(
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
            ),
            SizedBox(
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
            74.verticalSpace,

            24.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: Row(
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
            ),
            16.verticalSpace,
            Container(
              margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 24.h),
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
                      style: AppTextStyle.boldNormal.copyWith(fontSize: 16.sp)),
                  Text("Write some general notes about this person",
                      style: AppTextStyle.regularNormal
                          .copyWith(fontSize: 16.sp, height: 1.6)),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 24.h),
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
                      Text("Likes" ' ',
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
              margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 24.h),
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
              margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 24.h),
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
              margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 24.h),
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
                      Text("Cons" ' ',
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: SizedBox(
                height: 40.h,
                width: MediaQuery.of(context).size.width,
                child: OutlinedButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const Safety()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    primary: Color(0xffCFE8FB),
                    //  fixedSize: Size(101.w, 32.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        12.0.r,
                      ),
                    ),
                  ),
                  child: Wrap(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/add.svg',
                        height: 18.h,
                        color: Color(0xff41A3F0),
                      ),
                      Text(' ' 'Add Note',
                          style: AppTextStyle.boldNormal.copyWith(
                            fontSize: 16.sp,
                            color: Color(0xff41A3F0),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            12.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: Row(
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
            ),
            12.verticalSpace,
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 24.h),
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
                      style: AppTextStyle.boldNormal.copyWith(fontSize: 16.sp)),
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
                  left: 24.h, right: 24.h, bottom: 24.h, top: 0),
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
                      style: AppTextStyle.boldNormal.copyWith(fontSize: 16.sp)),
                  Text(
                    "Add a username",
                    style: AppTextStyle.regularNormal.copyWith(
                        fontSize: 16.sp, height: 1.6, color: Colors.blue),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 0),
              child: SizedBox(
                height: 40.h,
                width: MediaQuery.of(context).size.width,
                child: OutlinedButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const Safety()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    primary: Color(0xffCFE8FB),
                    //  fixedSize: Size(101.w, 32.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        12.0.r,
                      ),
                    ),
                    side: BorderSide(
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
            ),
            16.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: Row(
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
            ),
            12.verticalSpace,
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                  left: 24.h, right: 24.h, bottom: 24.h, top: 0),
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

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 0),
              child: SizedBox(
                height: 40.h,
                width: MediaQuery.of(context).size.width,
                child: OutlinedButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const Safety()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    primary: Color(0xffCFE8FB),
                    //  fixedSize: Size(101.w, 32.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        12.0.r,
                      ),
                    ),
                    side: BorderSide(
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
                        ' ' 'Add Date',
                        style: AppTextStyle.boldNormal.copyWith(
                          fontSize: 16.sp,
                          color: Color(0xff41A3F0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            16.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: Row(
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Container(
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
            ), // add padding s from here
            100.verticalSpace,
            //Here
          ],
        ),
      ),
    );
  }
}
