// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:tasker/app_utils/app_color.dart';
// import 'package:tasker/app_utils/app_text_style.dart';
//
// class AddButton extends StatelessWidget {
//   final String title;
//   final void Function() onTap;
//
//   const AddButton({
//     Key? key,
//     required this.title,
//     required this.onTap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onTap,
//       style: ElevatedButton.styleFrom(
//         elevation: 0.0,
//         padding: EdgeInsets.zero,
//         primary: AppColor.cCFE8FB,
//         fixedSize: Size(double.infinity, 40.h),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8.r),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SvgPicture.asset(
//             'assets/icons/add.svg',
//             height: 18.h,
//             width: 18.w,
//             color: AppColor.c41A3F0,
//           ),
//           14.horizontalSpace,
//           Text(
//             title,
//             style: AppTextStyle.boldNormal.copyWith(fontSize: 16.sp, color: const Color(0xff41A3F0),),
//           ),
//         ],
//       ),
//     );
//   }
// }
