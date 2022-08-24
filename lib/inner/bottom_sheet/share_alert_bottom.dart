import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'package:share_plus/share_plus.dart';
import 'package:tasker/app_utils/app_color.dart';
import 'package:tasker/app_utils/app_image.dart';
import 'package:tasker/app_utils/app_text_style.dart';
import 'package:tasker/emoji_text.dart';
import 'package:tasker/inner/bottom_sheet/back_button.dart';
import '../helper_class.dart';
import 'create_alert_bottom.dart';

class ShareAlertBottom extends StatefulWidget {
  const ShareAlertBottom({Key? key}) : super(key: key);

  @override
  State<ShareAlertBottom> createState() => _ShareAlertBottomState();
}

class _ShareAlertBottomState extends State<ShareAlertBottom> {
  var _image;
  // ImagePicker? imagePicker;
  final ImagePicker imagePicker = ImagePicker();
  var type;

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
          // width: double.maxFinite,
          // height: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              topRight: Radius.circular(25.r),
            ),
          ),
          padding: EdgeInsets.only(top: 8.h),
          //  height: 626.h,
          child: Column(
            children: <Widget>[
              Container(
                height: 5.h,
                width: 64.w,
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(30)),
              ),
              12.verticalSpace,
              Text(
                "Send Alert",
                style: AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
              ),
              4.verticalSpace,
              Text(
                "Please, type a comment if you want and send the alert",
                style: AppTextStyle.regularNormal
                    .copyWith(fontSize: 12.sp, color: AppColor.c62677D),
              ),
              32.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Container(
                  height: 74.h,
                  width: 1.sw,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColor.cF3F8FF,
                  ),
                  child: Center(
                      child: Column(
                    children: [
                      6.verticalSpace,
                      EmojiText(size: 32.h, text: '😍'),
                      6.verticalSpace,
                      Text("Hot",
                          style: AppTextStyle.regularNormal.copyWith(
                              fontSize: 14.sp, color: AppColor.c676F80))
                    ],
                  )),
// (
//                   emoji: '😍',
//                   emojiName: 'Love',
//                 ),
                ),
              ),
              12.verticalSpace,
              _image != null
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Stack(
                        children: [
                          Container(
                            width: 1.sw,
                            height: 102.h,
                            child: Image.file(
                              _image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: -8.h,
                            right: -8.w,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _image = null;
                                });
                              },
                              icon: Image.asset(
                                AppImage.close,
                                height: 24.h,
                                // color: AppColor.c41A3F0,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: OutlinedButton(
                        onPressed: () async {
                          debugPrint('Upload a Photo');
                          var source = type == ImageSourceType.camera
                              ? ImageSource.camera
                              : ImageSource.gallery;
                          XFile? image = await imagePicker.pickImage(
                              source: source,
                              imageQuality: 50,
                              preferredCameraDevice: CameraDevice.front);

                          final croppedFile = await ImageCropper().cropImage(
                            sourcePath: image!.path,
                            cropStyle: CropStyle.rectangle,
                            compressQuality: 100,
                            uiSettings: [
                              AndroidUiSettings(
                                toolbarTitle: 'Crop',
                                toolbarColor: AppColor.c0F5BCC,
                                toolbarWidgetColor: AppColor.c041733,
                                initAspectRatio: CropAspectRatioPreset.ratio7x5,
                                lockAspectRatio: true,
                              ),
                              IOSUiSettings(
                                title: 'Crop',
                                resetButtonHidden: false,
                                aspectRatioLockEnabled: true,
                              ),
                            ],
                          );

                          setState(() {
                            _image = File(croppedFile!.path);
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          //  minimumSize: Size(1.sw, 48.h),
                          padding: EdgeInsets.zero,
                          side: BorderSide(
                            width: 1.0,
                            color: Color(0xff41A3F0),
                          ),
                          fixedSize: Size(1.sw, 48.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              12.0.r,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImage.upload,
                              height: 18.h,
                              color: AppColor.c41A3F0,
                            ),
                            8.horizontalSpace,
                            Text(
                              'Upload a Photo',
                              style: AppTextStyle.boldNormal.copyWith(
                                fontSize: 16.sp,
                                color: Color(0xff41A3F0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              12.verticalSpace,
              Padding(
                padding: EdgeInsets.only(left: 24.0.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Write a comment",
                    style: AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
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
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: Icon(Icons.highlight_off)),
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
                  maxLines: 8,
                  minLines: 8,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                    fillColor: AppColor.cF6FAFE,
                    //  fillColor: AppColor.c00AE26,
                    filled: true,

                    // helperText: "Name",
                    labelText: "Comment",
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
                    // suffixIcon: IconButton(
                    //     onPressed: () {}, icon: Icon(Icons.highlight_off)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, style: BorderStyle.none),
                      borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    ),
                  ),
                ),
              ),
              12.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: ElevatedButton(
                    onPressed: () {
                      // sendAlert(context);
                      Share.share(
                          'https://play.google.com/store/apps/details?id=com.netflix.mediaclient&hl=en&gl=US');
                      // showModalBottomSheet(
                      //     context: context,
                      //     isScrollControlled: true,
                      //     backgroundColor: Colors.transparent,
                      //     builder: (context) {
                      //       return CreateAlertBottom();
                      //     });
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Send As Text',
                          style: AppTextStyle.boldNormal.copyWith(
                              color: AppColor.c41A3F0, fontSize: 16.sp),
                        ),
                      ],
                    )),
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
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return ShareAlertBottom();
                          });
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
                          'Send To Chat',
                          style: AppTextStyle.boldNormal
                              .copyWith(color: Colors.white, fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              12.verticalSpace,
            ],
          ),
        ),
      ],
    );
  }
}
