import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tasker/app_utils/app_text_style.dart';
import 'package:tasker/appbar.dart';
import 'package:tasker/bullet_box.dart';
import 'package:tasker/emoji_text.dart';
import 'package:tasker/inner/bottom_sheet/send_alert_bottom.dart';
import 'package:tasker/inner/create_rostr/createRostr_controller.dart';
import 'package:tasker/inner/photo_view.dart';
import '../bottom_sheet/send_alert_to_bottom.dart';
import 'inner_controller.dart';

class InnerScreen extends GetView<InnerController> {
  InnerScreen({Key? key}) : super(key: key);
  final createRostrController = Get.find<CreateRostrController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InnerController>(
      builder: (ctr) => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBarScreen(
          appbarTitle: 'Rostr',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 12.h,
              ),
              InkWell(
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                      builder: (context) => const PhotoViewPage(
                        images: [
                          "https://faces-img.xcdn.link/thumb-lorem-face-6225_thumb.jpg",
                          "https://faces-img.xcdn.link/thumb-lorem-face-5883_thumb.jpg",
                          "https://faces-img.xcdn.link/thumb-lorem-face-2752_thumb.jpg",
                          "https://faces-img.xcdn.link/thumb-lorem-face-770_thumb.jpg"
                        ],
                        selectedImgIndex: 0,
                      ),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    "https://faces-img.xcdn.link/thumb-lorem-face-6225_thumb.jpg",
                    height: 96.h,
                    width: 96.h,
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                "Zander Valenstein",
                style: AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                "24 years old",
                style: AppTextStyle.regularNormal
                    .copyWith(fontSize: 14.sp, color: Colors.black54),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Tinder",
                style: AppTextStyle.regularNormal
                    .copyWith(fontSize: 14.sp, color: Colors.black54),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        controller.openBottomSheet(
                            bottomSheet: const SendAlertBottom(),
                            isCleanSelectedEmoji: true);
                      },
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        side: const BorderSide(
                          width: 3.0,
                          color: Color(0xff41A3F0),
                        ),
                        fixedSize: Size(101.w, 34.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            30.0.r,
                          ),
                        ),
                      ),


                      //#send alert
                      child: Text('Send Alert',
                          style: AppTextStyle.boldNormal.copyWith(
                            fontSize: 16.sp,
                            color: const Color(0xff41A3F0),
                          )),
                    ),
                    12.horizontalSpace,
                    ElevatedButton(
                      onPressed: () {

                        //#Send To Alert ni
                        // Shu yerda ochib quyayabman
                        controller.openBottomSheet(
                          bottomSheet: const SendAlertToBottom(),
                        );

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const Safety()));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        primary: const Color(0xffCFE8FB),
                        fixedSize: Size(101.w, 32.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            30.0.r,
                          ),
                        ),
                      ),
                      child: Text('Edit Info',
                          style: AppTextStyle.boldNormal.copyWith(
                            fontSize: 16.sp,
                            color: const Color(0xff41A3F0),
                          )),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,ghghghghghhghgghhghggh

                        //     MaterialPageRoute(
                        //         builder: (context) => const Safety()));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        primary: Color(0xff41A3F0),
                        fixedSize: Size(101.w, 34.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            30.0.r,
                          ),
                        ),
                      ),
                      child: Text('Message',
                          style: AppTextStyle.boldNormal
                              .copyWith(color: Colors.white)),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ratings",
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
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 24.h),
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
                        style:
                            AppTextStyle.boldNormal.copyWith(fontSize: 16.sp),
                      ),
                      Wrap(
                        alignment: WrapAlignment.start,
                        children: [
                          Text(
                            "9.6" " ",
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

              // Padding(
              //   padding: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 24.h),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Column(
              //         children: List.generate(
              //           ratings.length - ratings.length ~/ 2,
              //           (index) => Padding(
              //             padding: EdgeInsets.only(bottom: 12.0.h),
              //             child: Container(
              //               height: 38.h,
              //               width: MediaQuery.of(context).size.width / 2 - 30.h,
              //               decoration: BoxDecoration(
              //                   color: Colors.white,
              //                   borderRadius: BorderRadius.circular(8.r)),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Text(
              //                     " ${ratings[ratings.length ~/ 2 + index].ratingTitle}",
              //                     style: AppTextStyle.regularNormal
              //                         .copyWith(fontSize: 16.sp),
              //                   ),
              //                   Wrap(
              //                     alignment: WrapAlignment.start,
              //                     children: [
              //                       Text(
              //                         "${ratings[ratings.length ~/ 2 + index].ratingScore} ",
              //                         style: AppTextStyle.boldNormal.copyWith(
              //                           fontSize: 16.sp,
              //                           color: Color(0xff00AE26),
              //                         ),
              //                       ),
              //                       const Icon(
              //                         Icons.grade,
              //                         color: Colors.amber,
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //       Column(
              //         children: List.generate(
              //           ratings.length ~/ 2,
              //           (index) => Padding(
              //             padding: EdgeInsets.only(bottom: 12.0.h),
              //             child: Container(
              //               height: 38.h,
              //               width: MediaQuery.of(context).size.width / 2 - 30.h,
              //               decoration: BoxDecoration(
              //                   color: Colors.white,
              //                   borderRadius: BorderRadius.circular(8.r)),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Text(
              //                     " ${ratings[index].ratingTitle}",
              //                     style: AppTextStyle.regularNormal
              //                         .copyWith(fontSize: 16.sp),
              //                   ),
              //                   Wrap(
              //                     alignment: WrapAlignment.start,
              //                     children: [
              //                       Text(
              //                         "${ratings[index].ratingScore} ",
              //                         style: AppTextStyle.boldNormal.copyWith(
              //                           fontSize: 16.sp,
              //                           color: Color(0xff00AE26),
              //                         ),
              //                       ),
              //                       const Icon(
              //                         Icons.grade,
              //                         color: Colors.amber,
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
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
                        primary: const Color(0xffCFE8FB),

                        //  fixedSize: Size(101.w, 32.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            12.0.r,
                          ),
                        ),
                        side: const BorderSide(
                          color: Colors.transparent,
                        )),
                    child: Wrap(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/add.svg',
                          height: 18.h,
                          color: Color(0xff41A3F0),
                        ),
                        Text(' ' 'Add Rating',
                            style: AppTextStyle.boldNormal.copyWith(
                              fontSize: 16.sp,
                              color: Color(0xff41A3F0),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.h),
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
                  createRostrController.tags.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(right: 12.h, bottom: 12.h),
                    child: Container(
                      padding: EdgeInsets.all(8.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.h),
                        color: Colors.white,
                      ),
                      child: Text(
                        createRostrController.tags[index].title,
                        style: AppTextStyle.regularNormal.copyWith(
                          fontSize: 14.sp,
                          color: Color(createRostrController.tags[index].color),
                        ),
                      ),
                    ),
                  ),
                )),
              ),
              SizedBox(
                height: 74.h,
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
                        primary: const Color(0xffCFE8FB),
                        //  fixedSize: Size(101.w, 32.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            12.0.r,
                          ),
                        ),
                        side: const BorderSide(
                          color: Colors.transparent,
                        )),
                    child: Wrap(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/add.svg',
                          height: 18.h,
                          color: Color(0xff41A3F0),
                        ),
                        Text(' ' 'Add Rating',
                            style: AppTextStyle.boldNormal.copyWith(
                              fontSize: 16.sp,
                              color: Color(0xff41A3F0),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
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
              SizedBox(
                height: 16.h,
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
                    Text("General Notes",
                        style:
                            AppTextStyle.boldNormal.copyWith(fontSize: 16.sp)),
                    BulletList(const [
                      "Really outgoing and gets along well with my friends",
                      "Met him at the bar",
                      "Told me that he is looking for a relationship but he just got out of one 3 month ago",
                      "He wroks in real estate",
                      "He is so confident",
                      "His family is very religious"
                    ]),
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
                    BulletList(const [
                      "He loves to watch Breaking bad on netflix",
                      "Likes basketball"
                    ]),
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
                    BulletList([
                      "He doesn’t like red wine",
                      "He doesn’t like cold weather"
                    ]),
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
                    BulletList(
                        ["Very Smart", "He is very funny and confident"]),
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
                    BulletList(
                        ["Different life goals", "He doesn’t like children"]),
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
              SizedBox(height: 12.h),
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
              SizedBox(height: 12.h),
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
                        style:
                            AppTextStyle.boldNormal.copyWith(fontSize: 16.sp)),
                    Text(
                      "408-777-9999",
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
                        style:
                            AppTextStyle.boldNormal.copyWith(fontSize: 16.sp)),
                    Text(
                      "408-777-9999",
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
              SizedBox(height: 16.h),
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
              SizedBox(height: 12.h),
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
                        Text("First Date",
                            style: AppTextStyle.boldNormal
                                .copyWith(fontSize: 16.sp)),
                        Text("12/11/21",
                            style: AppTextStyle.boldNormal
                                .copyWith(fontSize: 16.sp)),
                      ],
                    ),
                    Text(
                      "Claud Monne Restaurant",
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
              SizedBox(height: 16.h),
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
              SizedBox(height: 12.h),
              Container(
                height: 38.h,
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
                        Text("Starting Lineup",
                            style: AppTextStyle.boldNormal
                                .copyWith(fontSize: 16.sp)),
                        Text("1",
                            style: AppTextStyle.regularNormal
                                .copyWith(fontSize: 16.sp)),
                      ],
                    ),
                  ],
                ),
              ), // add padding s from here
              SizedBox(
                height: 100.h,
              ),
              //Here
            ],
          ),
        ),
      ),
    );
  }
}
