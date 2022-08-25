import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tasker/app_utils/app_color.dart';
import 'package:tasker/app_utils/app_image.dart';
import 'package:tasker/app_utils/app_text_style.dart';
import 'package:tasker/appbar.dart';
import 'package:tasker/emoji_text.dart';
import 'package:tasker/inner/component/custom_checkbox_list.dart';
import 'package:tasker/inner/create_rostr/createRostr_controller.dart';
import 'package:tasker/inner/local_back.dart';

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
      body: SizedBox(
        height: 150,
        width: 150,
        child: Center(
          child: Stack(
            children: [
            Image.asset(
                          AppImage.avatar2,
                          height: 130.h,
                          width: 130.h,
                        ),
              Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 30,
                ),
              )
            ],
          ),
        ),
      )



      // GetBuilder<CreateRostrController>(
      //   builder: (ctrl) {
      //     return SingleChildScrollView(
      //       padding: EdgeInsets.only(left: 24.w,right: 24.w),
      //       child: Column(
      //         children: [
      //           12.verticalSpace,
      //           ClipRRect(
      //             clipBehavior: Clip.antiAlias,
      //             borderRadius: BorderRadius.only(bottomRight: Radius.circular(40)),
      //             child: Image.asset(
      //               AppImage.avatar2,
      //               height: 96.h,
      //               width: 96.h,
      //             ),
      //           ),
      //
      //           12.verticalSpace,
      //           Text(
      //             "Add A Photo",
      //             style: AppTextStyle.boldNormal.copyWith(fontSize: 18.sp)
      //           ),
      //
      //           16.verticalSpace,
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             children: [
      //               Text(
      //                 "Personal Info",
      //                 style: AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
      //               ),
      //             ],
      //           ),
      //           12.verticalSpace,
      //           TextFormField(
      //             style: AppTextStyle.regularNormal.copyWith(
      //               color: AppColor.c15213B,
      //               fontSize: 16.sp,
      //             ),
      //             decoration: InputDecoration(
      //               contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
      //               fillColor: AppColor.cF6FAFE,
      //               filled: true,
      //               // helperText: "Name",
      //               hintText: "Name",
      //               floatingLabelAlignment: FloatingLabelAlignment.start,
      //               alignLabelWithHint: false,
      //               floatingLabelStyle: AppTextStyle.regularNormal.copyWith(
      //                 fontSize: 16.sp,
      //                 color: AppColor.c969BA7,
      //               ),
      //               // hintText: "e.g. Handsome",
      //               labelStyle: AppTextStyle.regularNormal.copyWith(
      //                 color: AppColor.c969BA7,
      //                 fontSize: 12.sp,
      //                 height: 2.h,
      //               ),
      //               border: OutlineInputBorder(
      //                 borderSide:
      //                     const BorderSide(width: 0, style: BorderStyle.none),
      //                 borderRadius: BorderRadius.all(Radius.circular(12.r)),
      //               ),
      //             ),
      //           ),
      //           12.verticalSpace,
      //           TextFormField(
      //             style: AppTextStyle.regularNormal.copyWith(
      //               color: AppColor.c15213B,
      //               fontSize: 16.sp,
      //             ),
      //             decoration: InputDecoration(
      //               contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
      //               fillColor: AppColor.cF6FAFE,
      //               filled: true,
      //               // helperText: "Name",
      //               hintText: "Date of birth (MM/DD/YYYY) / Age (XX)",
      //               floatingLabelAlignment: FloatingLabelAlignment.start,
      //               alignLabelWithHint: false,
      //               floatingLabelStyle: AppTextStyle.regularNormal.copyWith(
      //                 fontSize: 16.sp,
      //                 color: AppColor.c969BA7,
      //               ),
      //               // hintText: "e.g. Handsome",
      //               labelStyle: AppTextStyle.regularNormal.copyWith(
      //                 color: AppColor.c969BA7,
      //                 fontSize: 12.sp,
      //                 height: 2.h,
      //               ),
      //               border: OutlineInputBorder(
      //                 borderSide:
      //                     const BorderSide(width: 0, style: BorderStyle.none),
      //                 borderRadius: BorderRadius.all(Radius.circular(12.r)),
      //               ),
      //             ),
      //           ),
      //           12.verticalSpace,
      //           TextFormField(
      //             style: AppTextStyle.regularNormal.copyWith(
      //               color: AppColor.c15213B,
      //               fontSize: 16.sp,
      //             ),
      //             decoration: InputDecoration(
      //               contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
      //               fillColor: AppColor.cF6FAFE,
      //               filled: true,
      //               // helperText: "Name",
      //               hintText: "Where we met",
      //               floatingLabelAlignment: FloatingLabelAlignment.start,
      //               alignLabelWithHint: false,
      //               floatingLabelStyle: AppTextStyle.regularNormal.copyWith(
      //                 fontSize: 16.sp,
      //                 color: AppColor.c969BA7,
      //               ),
      //               // hintText: "e.g. Handsome",
      //               labelStyle: AppTextStyle.regularNormal.copyWith(
      //                 color: AppColor.c969BA7,
      //                 fontSize: 12.sp,
      //                 height: 2.h,
      //               ),
      //               border: OutlineInputBorder(
      //                 borderSide:
      //                     const BorderSide(width: 0, style: BorderStyle.none),
      //                 borderRadius: BorderRadius.all(Radius.circular(12.r)),
      //               ),
      //             ),
      //           ),
      //
      //           16.verticalSpace,
      //           InkWell(
      //             onTap: () {},
      //             child: CustomCheckboxList(
      //               text: 'Enable ratings',
      //               value: createRostrController.enableRating,
      //               onChanged: (value) {
      //                 createRostrController.changeRating(value);
      //               },
      //               activeColor: Colors.red,
      //               activeText: 'On',
      //               inactiveText: 'Off',
      //               activeTextColor: AppColor.white,
      //               inactiveTextColor: AppColor.c969696,
      //             ),
      //           ),
      //
      //          createRostrController.enableRating ? ElevatedButton(
      //              onPressed: () {
      //
      //              },
      //              style: ElevatedButton.styleFrom(
      //                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      //                  primary:  AppColor.cCFE8FB,
      //                  shadowColor: Colors.transparent,
      //                  fixedSize: Size.fromHeight(48.h)),
      //              child: Center(
      //                child: Text(
      //                  'Add Rating',
      //                  style: AppTextStyle.boldNormal.copyWith(
      //                      color: const Color(0xff41A3F0), fontSize: 16.sp),
      //                ),
      //              ))
      //                 : Column(
      //                     children: [
      //                       Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                         children: [
      //                           Text(
      //                             "Ratings",
      //                             style: AppTextStyle.boldNormal
      //                                 .copyWith(fontSize: 18.sp),
      //                           ),
      //                           TextButton(
      //                             onPressed: () {},
      //                             child: Text(
      //                               "Edit",
      //                               style: AppTextStyle.boldNormal.copyWith(
      //                                   fontSize: 16.sp, color: Colors.red),
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                       16.verticalSpace,
      //                       Padding(
      //                         padding: EdgeInsets.only( bottom: 24.h),
      //                         child: Container(
      //                           height: 38.h,
      //                           decoration: BoxDecoration(
      //                               color: Colors.white,
      //                               borderRadius: BorderRadius.circular(8.r)),
      //                           child: Row(
      //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                             children: [
      //                               Text(
      //                                 " " "Overall Rating",
      //                                 style: AppTextStyle.boldNormal
      //                                     .copyWith(fontSize: 16.sp),
      //                               ),
      //                               Wrap(
      //                                 alignment: WrapAlignment.start,
      //                                 children: [
      //                                   Text(
      //                                     "- -" " ",
      //                                     style: AppTextStyle.boldNormal.copyWith(
      //                                       fontSize: 16.sp,
      //                                       color: Color(0xff00AE26),
      //                                     ),
      //                                   ),
      //                                   const Icon(
      //                                     Icons.grade,
      //                                     color: Colors.amber,
      //                                   ),
      //                                 ],
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                       ),
      //
      //                       ///................................................................
      //                       Padding(
      //                         padding: EdgeInsets.only(bottom: 24.h),
      //                         child: Row(
      //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Column(
      //                               children: List.generate(
      //                                 ratings.length - ratings.length ~/ 2,
      //                                 (index) => Padding(
      //                                   padding: EdgeInsets.only(bottom: 12.0.h),
      //                                   child: Container(
      //                                     height: 38.h,
      //                                     width: MediaQuery.of(context).size.width /
      //                                             2 -
      //                                         30.h,
      //                                     decoration: BoxDecoration(
      //                                         color: Colors.white,
      //                                         borderRadius:
      //                                             BorderRadius.circular(8.r)),
      //                                     child: Row(
      //                                       mainAxisAlignment:
      //                                           MainAxisAlignment.spaceBetween,
      //                                       children: [
      //                                         Text(
      //                                           " ${ratings[ratings.length ~/ 2 + index].ratingTitle}",
      //                                           style: AppTextStyle.regularNormal
      //                                               .copyWith(fontSize: 16.sp),
      //                                         ),
      //                                         Wrap(
      //                                           alignment: WrapAlignment.start,
      //                                           children: [
      //                                             Text(
      //                                               "${ratings[ratings.length ~/ 2 + index].ratingScore} ",
      //                                               style: AppTextStyle.boldNormal
      //                                                   .copyWith(
      //                                                 fontSize: 16.sp,
      //                                                 color: const Color(0xff00AE26),
      //                                               ),
      //                                             ),
      //                                             const Icon(
      //                                               Icons.grade,
      //                                               color: Colors.amber,
      //                                             ),
      //                                           ],
      //                                         ),
      //                                       ],
      //                                     ),
      //                                   ),
      //                                 ),
      //                               ),
      //                             ),
      //                             Column(
      //                               children: List.generate(
      //                                 ratings.length ~/ 2,
      //                                 (index) => Padding(
      //                                   padding: EdgeInsets.only(bottom: 12.0.h),
      //                                   child: Container(
      //                                     height: 38.h,
      //                                     width: MediaQuery.of(context).size.width /
      //                                             2 -
      //                                         30.h,
      //                                     decoration: BoxDecoration(
      //                                         color: Colors.white,
      //                                         borderRadius:
      //                                             BorderRadius.circular(8.r)),
      //                                     child: Row(
      //                                       mainAxisAlignment:
      //                                           MainAxisAlignment.spaceBetween,
      //                                       children: [
      //                                         Text(
      //                                           " ${ratings[index].ratingTitle}",
      //                                           style: AppTextStyle.regularNormal
      //                                               .copyWith(fontSize: 16.sp),
      //                                         ),
      //                                         Wrap(
      //                                           alignment: WrapAlignment.start,
      //                                           children: [
      //                                             Text(
      //                                               "${ratings[index].ratingScore} ",
      //                                               style: AppTextStyle.boldNormal
      //                                                   .copyWith(
      //                                                 fontSize: 16.sp,
      //                                                 color: const Color(0xff00AE26),
      //                                               ),
      //                                             ),
      //                                             const Icon(
      //                                               Icons.grade,
      //                                               color: Colors.amber,
      //                                             ),
      //                                           ],
      //                                         ),
      //                                       ],
      //                                     ),
      //                                   ),
      //                                 ),
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Text(
      //                 "Tags",
      //                 style: AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
      //               ),
      //               TextButton(
      //                 onPressed: () {},
      //                 child: Text(
      //                   "Edit",
      //                   style: AppTextStyle.boldNormal
      //                       .copyWith(fontSize: 16.sp, color: Colors.red),
      //                 ),
      //               ),
      //             ],
      //           ),
      //           SizedBox(
      //             height: 60.h,
      //             width: MediaQuery.of(context).size.width - 48.h,
      //             child: Wrap(
      //                 children: List.generate(
      //               tags.length,
      //               (index) => Padding(
      //                 padding: EdgeInsets.only(right: 12.h, bottom: 12.h),
      //                 child: Container(
      //                   padding: EdgeInsets.all(8.h),
      //                   decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(8.h),
      //                     color: Colors.white,
      //                   ),
      //                   child: Text(tags[index].lookTitle,
      //                       style: AppTextStyle.regularNormal.copyWith(
      //                           fontSize: 14.sp, color: tags[index].lookColor)),
      //                 ),
      //               ),
      //             )),
      //           ),
      //           74.verticalSpace,
      //
      //           24.verticalSpace,
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Text(
      //                 "Notes",
      //                 style: AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
      //               ),
      //               TextButton(
      //                 onPressed: () {},
      //                 child: Text(
      //                   "Edit",
      //                   style: AppTextStyle.boldNormal
      //                       .copyWith(fontSize: 16.sp, color: Colors.red),
      //                 ),
      //               ),
      //             ],
      //           ),
      //           16.verticalSpace,
      //           Container(
      //             margin: EdgeInsets.only(bottom: 24.h),
      //             padding: EdgeInsets.all(8.h),
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(12.r),
      //               color: Colors.white,
      //             ),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text("General Notes",
      //                     style: AppTextStyle.boldNormal.copyWith(fontSize: 16.sp)),
      //                 Text("Write some general notes about this person",
      //                     style: AppTextStyle.regularNormal
      //                         .copyWith(fontSize: 16.sp, height: 1.6)),
      //               ],
      //             ),
      //           ),
      //           Container(
      //             margin: EdgeInsets.only(bottom: 24.h),
      //             padding: EdgeInsets.all(8.h),
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(12.r),
      //               color: Colors.white,
      //             ),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Row(
      //                   children: [
      //                     Text("Likes" ' ',
      //                         style: AppTextStyle.boldNormal
      //                             .copyWith(fontSize: 16.sp)),
      //                     EmojiText(
      //                       text: '👍',
      //                       size: 21.h,
      //                     ),
      //                   ],
      //                 ),
      //                 Text("Write things that this person likes",
      //                     style: AppTextStyle.regularNormal
      //                         .copyWith(fontSize: 16.sp, height: 1.6)),
      //               ],
      //             ),
      //           ),
      //           Container(
      //             width: MediaQuery.of(context).size.width,
      //             margin: EdgeInsets.only(bottom: 24.h),
      //             padding: EdgeInsets.all(8.h),
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(12.r),
      //               color: Colors.white,
      //             ),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Row(
      //                   children: [
      //                     Text("Dislikes",
      //                         style: AppTextStyle.boldNormal
      //                             .copyWith(fontSize: 16.sp)),
      //                     EmojiText(
      //                       text: '👎',
      //                       size: 21.h,
      //                     ),
      //                   ],
      //                 ),
      //                 Text("Write things that this person dislikes",
      //                     style: AppTextStyle.regularNormal
      //                         .copyWith(fontSize: 16.sp, height: 1.6)),
      //               ],
      //             ),
      //           ),
      //           Container(
      //             width: MediaQuery.of(context).size.width,
      //             margin: EdgeInsets.only(bottom: 24.h),
      //             padding: EdgeInsets.all(8.h),
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(12.r),
      //               color: Colors.white,
      //             ),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Row(
      //                   children: [
      //                     Text("Pros" ' ',
      //                         style: AppTextStyle.boldNormal
      //                             .copyWith(fontSize: 16.sp)),
      //                     EmojiText(
      //                       text: '🟢',
      //                       size: 16.h,
      //                     ),
      //                   ],
      //                 ),
      //                 Text("Write things that YOU like about this person",
      //                     style: AppTextStyle.regularNormal
      //                         .copyWith(fontSize: 16.sp, height: 1.6)),
      //               ],
      //             ),
      //           ),
      //           Container(
      //             width: MediaQuery.of(context).size.width,
      //             margin: EdgeInsets.only(bottom: 24.h),
      //             padding: EdgeInsets.all(8.h),
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(12.r),
      //               color: Colors.white,
      //             ),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Row(
      //                   children: [
      //                     Text("Cons" ' ',
      //                         style: AppTextStyle.boldNormal
      //                             .copyWith(fontSize: 16.sp)),
      //                     EmojiText(
      //                       text: '🔴',
      //                       size: 16.h,
      //                     ),
      //                   ],
      //                 ),
      //                 Text("Write things that you consider drawbacks / red flags",
      //                     style: AppTextStyle.regularNormal
      //                         .copyWith(fontSize: 16.sp, height: 1.6)),
      //               ],
      //             ),
      //           ),
      //           SizedBox(
      //             height: 40.h,
      //             width: MediaQuery.of(context).size.width,
      //             child: OutlinedButton(
      //               onPressed: () {
      //                 // Navigator.push(
      //                 //     context,
      //                 //     MaterialPageRoute(
      //                 //         builder: (context) => const Safety()));
      //               },
      //               style: ElevatedButton.styleFrom(
      //                 padding: EdgeInsets.zero,
      //                 primary: const Color(0xffCFE8FB),
      //                 //  fixedSize: Size(101.w, 32.h),
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(
      //                     12.0.r,
      //                   ),
      //                 ),
      //               ),
      //               child: Wrap(
      //                 children: [
      //                   SvgPicture.asset(
      //                     'assets/icons/add.svg',
      //                     height: 18.h,
      //                     color: const Color(0xff41A3F0),
      //                   ),
      //                   Text(' ' 'Add Note',
      //                       style: AppTextStyle.boldNormal.copyWith(
      //                         fontSize: 16.sp,
      //                         color: const Color(0xff41A3F0),
      //                       )),
      //                 ],
      //               ),
      //             ),
      //           ),
      //           12.verticalSpace,
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Text(
      //                 "Contacts",
      //                 style: AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
      //               ),
      //               TextButton(
      //                 onPressed: () {},
      //                 child: Text(
      //                   "Edit",
      //                   style: AppTextStyle.boldNormal
      //                       .copyWith(fontSize: 16.sp, color: Colors.red),
      //                 ),
      //               ),
      //             ],
      //           ),
      //           12.verticalSpace,
      //           Container(
      //             width: MediaQuery.of(context).size.width,
      //             margin: EdgeInsets.only(bottom: 24.h),
      //             padding: EdgeInsets.all(8.h),
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(12.r),
      //               color: Colors.white,
      //             ),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text("Phone Number",
      //                     style: AppTextStyle.boldNormal.copyWith(fontSize: 16.sp)),
      //                 Text(
      //                   "Add phone number or other contacts",
      //                   style: AppTextStyle.regularNormal.copyWith(
      //                       fontSize: 16.sp, height: 1.6, color: Colors.blue),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           Container(
      //             width: MediaQuery.of(context).size.width,
      //             margin: EdgeInsets.only(bottom: 24.h,),
      //             padding: EdgeInsets.all(8.h),
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(12.r),
      //               color: Colors.white,
      //             ),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text("Snapchat",
      //                     style: AppTextStyle.boldNormal.copyWith(fontSize: 16.sp)),
      //                 Text(
      //                   "Add a username",
      //                   style: AppTextStyle.regularNormal.copyWith(
      //                       fontSize: 16.sp, height: 1.6, color: Colors.blue),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           SizedBox(
      //             height: 40.h,
      //             width: MediaQuery.of(context).size.width,
      //             child: OutlinedButton(
      //               onPressed: () {
      //                 // Navigator.push(
      //                 //     context,
      //                 //     MaterialPageRoute(
      //                 //         builder: (context) => const Safety()));
      //               },
      //               style: ElevatedButton.styleFrom(
      //                 padding: EdgeInsets.zero,
      //                 primary: const Color(0xffCFE8FB),
      //                 //  fixedSize: Size(101.w, 32.h),
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(
      //                     12.0.r,
      //                   ),
      //                 ),
      //                 side: const BorderSide(
      //                   color: Colors.transparent,
      //                 ),
      //               ),
      //               child: Wrap(
      //                 children: [
      //                   SvgPicture.asset(
      //                     'assets/icons/add.svg',
      //                     height: 18.h,
      //                     color: Color(0xff41A3F0),
      //                   ),
      //                   Text(
      //                     ' ' 'Add Contact',
      //                     style: AppTextStyle.boldNormal.copyWith(
      //                       fontSize: 16.sp,
      //                       color: Color(0xff41A3F0),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //           16.verticalSpace,
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Text(
      //                 "Dates",
      //                 style: AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
      //               ),
      //               TextButton(
      //                 onPressed: () {},
      //                 child: Text(
      //                   "Edit",
      //                   style: AppTextStyle.boldNormal
      //                       .copyWith(fontSize: 16.sp, color: Colors.red),
      //                 ),
      //               ),
      //             ],
      //           ),
      //           12.verticalSpace,
      //           Container(
      //             width: MediaQuery.of(context).size.width,
      //             margin: EdgeInsets.only(bottom: 24.h,),
      //             padding: EdgeInsets.all(8.h),
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(12.r),
      //               color: Colors.white,
      //             ),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Text("Event",
      //                         style: AppTextStyle.boldNormal
      //                             .copyWith(fontSize: 16.sp)),
      //                     Text("01/01/21",
      //                         style: AppTextStyle.boldNormal
      //                             .copyWith(fontSize: 16.sp)),
      //                   ],
      //                 ),
      //                 Text(
      //                   "This section allows you to add events that take place between you and this person, such as a first kiss, dates, and other events. Created events will also be saved to your calendar in the Rostr Tools section. ",
      //                   style: AppTextStyle.regularNormal
      //                       .copyWith(fontSize: 16.sp, height: 1.6),
      //                 ),
      //               ],
      //             ),
      //           ),
      //
      //           SizedBox(
      //             height: 40.h,
      //             width: MediaQuery.of(context).size.width,
      //             child: OutlinedButton(
      //               onPressed: () {
      //                 // Navigator.push(
      //                 //     context,
      //                 //     MaterialPageRoute(
      //                 //         builder: (context) => const Safety()));
      //               },
      //               style: ElevatedButton.styleFrom(
      //                 padding: EdgeInsets.zero,
      //                 primary: const Color(0xffCFE8FB),
      //                 //  fixedSize: Size(101.w, 32.h),
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(
      //                     12.0.r,
      //                   ),
      //                 ),
      //                 side: const BorderSide(
      //                   color: Colors.transparent,
      //                 ),
      //               ),
      //               child: Wrap(
      //                 children: [
      //                   SvgPicture.asset(
      //                     'assets/icons/add.svg',
      //                     height: 18.h,
      //                     color: Color(0xff41A3F0),
      //                   ),
      //                   Text(
      //                     ' ' 'Add Date',
      //                     style: AppTextStyle.boldNormal.copyWith(
      //                       fontSize: 16.sp,
      //                       color: const Color(0xff41A3F0),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //           16.verticalSpace,
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Text(
      //                 "Position",
      //                 style: AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
      //               ),
      //               TextButton(
      //                 onPressed: () {},
      //                 child: Text(
      //                   "Edit",
      //                   style: AppTextStyle.boldNormal
      //                       .copyWith(fontSize: 16.sp, color: Colors.red),
      //                 ),
      //               ),
      //             ],
      //           ),
      //           12.verticalSpace,
      //           Container(
      //             padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      //             decoration: BoxDecoration(
      //               color: AppColor.cF6FAFE,
      //               borderRadius: BorderRadius.all(Radius.circular(12.r)),
      //             ),
      //             child: DropdownButton<String>(
      //                 underline: const SizedBox(),
      //                 value: sectionValue,
      //                 isDense: true,
      //                 isExpanded: true,
      //                 items: sectionItems.map((String items) {
      //                   return DropdownMenuItem(
      //                     value: items,
      //                     child: Text(items),
      //                   );
      //                 }).toList(),
      //                 onChanged: (value) {}),
      //           ),
      //           12.verticalSpace,
      //           Container(
      //             padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      //             decoration: BoxDecoration(
      //               color: AppColor.cF6FAFE,
      //               borderRadius: BorderRadius.all(Radius.circular(12.r)),
      //             ),
      //             child: DropdownButton<String>(
      //                 underline: const SizedBox(),
      //                 value: folderValue,
      //                 isDense: true,
      //                 isExpanded: true,
      //                 items: folderItems.map((String items) {
      //                   return DropdownMenuItem(
      //                     value: items,
      //                     child: Text(items),
      //                   );
      //                 }).toList(),
      //                 onChanged: (value) {}),
      //           ),
      //           12.verticalSpace,
      //           Container(
      //             decoration: BoxDecoration(
      //                 gradient: AppColor.gradient_03,
      //                 borderRadius: BorderRadius.circular(12.r)),
      //             child: ElevatedButton(
      //               onPressed: () {
      //                 // showModalBottomSheet(
      //                 //     context: context,
      //                 //     isScrollControlled: true,
      //                 //     backgroundColor: Colors.transparent,
      //                 //     builder: (context) {
      //                 //       return ShareAlertBottom();
      //                 //     });
      //               }, //AppColor.gradient_03
      //               style: ElevatedButton.styleFrom(
      //                 primary: Colors.transparent,
      //                 shadowColor: Colors.transparent,
      //               ),
      //               child: Row(
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   8.horizontalSpace,
      //                   Text(
      //                     'Create',
      //                     style: AppTextStyle.boldNormal
      //                         .copyWith(color: Colors.white, fontSize: 16.sp),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ), // add padding s from here
      //           100.verticalSpace,
      //           //Here
      //         ],
      //       ),
      //     );
      //   }
      // ),
    );
  }
}
