import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tasker/app_utils/app_text_style.dart';
import 'package:tasker/inner/create_rostr/createRostr_controller.dart';
import 'package:tasker/inner/create_rostr/widgets/create_note_bottom_sheet.dart';

class CreateRostrElevatedButton extends StatelessWidget {
  final String buttonText;
  final Widget bottomSheet;
  final CreateRostrController createRostrController;

  const CreateRostrElevatedButton(
      {Key? key,
      required this.buttonText,
      required this.bottomSheet,
      required this.createRostrController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          createRostrController.openBottomSheet(bottomSheet: bottomSheet);
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: EdgeInsets.zero,
          primary: const Color(0xffCFE8FB),
          //  fixedSize: Size(101.w, 32.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              12.0.r,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/add.svg',
              height: 18.h,
              color: const Color(0xff41A3F0),
            ),
            4.horizontalSpace,
            Text(
              buttonText,
              style: AppTextStyle.boldNormal.copyWith(
                fontSize: 16.sp,
                color: const Color(0xff41A3F0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// SizedBox(
//   height: 40.h,
//   width: MediaQuery.of(context).size.width,
//   child: OutlinedButton(
//     onPressed: () {
//       Get.bottomSheet(CreateNoteBottomSheet(createRostrController: createRostrController,));
//     },
//     style: ElevatedButton.styleFrom(
//       padding: EdgeInsets.zero,
//       primary: const Color(0xffCFE8FB),
//       //  fixedSize: Size(101.w, 32.h),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(
//           12.0.r,
//         ),
//       ),
//     ),
//     child: Wrap(
//       children: [
//         SvgPicture.asset(
//           'assets/icons/add.svg',
//           height: 18.h,
//           color: const Color(0xff41A3F0),
//         ),
//         Text(' ' 'Add Note',
//             style: AppTextStyle.boldNormal.copyWith(
//               fontSize: 16.sp,
//               color: const Color(0xff41A3F0),
//             )),
//       ],
//     ),
//   ),
// ),
