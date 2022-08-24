import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tasker/app_utils/app_text_style.dart';

class AppBarScreen extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String appbarTitle;

  AppBarScreen({Key? key, required this.appbarTitle})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(appbarTitle,
          style: AppTextStyle.boldNormal
              .copyWith(fontSize: 16.sp, color: Colors.black)),
      leading: IconButton(
        splashRadius: 1,
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () => Navigator.of(context).maybePop(),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: Colors.white,
              side: const BorderSide(width: 0, color: Colors.white),
            ),
            child: SvgPicture.asset("assets/icons/more.svg"),
            onPressed: () {
              PopupMenuButton<int>(
                icon: const Icon(Icons.more_vert),
                // offset: const Offset(20, 40),
                position: PopupMenuPosition.under,
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Text("Delete Entry"),
                  ),
                  const PopupMenuItem<int>(
                    value: 1,
                    child: Text("Move To Archive"),
                  ),
                ],
              );
            }, //=>  Get.toNamed(AppRouteName.rostrInner),
          ),
        ),
      ],
      elevation: 0,
      backgroundColor: const Color(0XffF5F5F5),
      automaticallyImplyLeading: true,
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        debugPrint("Deleted");
        break;
      case 1:
        debugPrint("Upload Additional");
        break;
    }
  }
}
