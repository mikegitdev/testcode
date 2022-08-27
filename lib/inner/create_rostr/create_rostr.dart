import 'package:get/get.dart';
import 'package:tasker/appbar.dart';
import 'package:flutter/material.dart';
import 'package:tasker/emoji_text.dart';
import 'package:tasker/app_utils/app_color.dart';
import 'package:tasker/app_utils/app_image.dart';
import 'package:tasker/app_utils/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasker/inner/bottom_sheet/rating_bottom_sheet.dart';
import 'package:tasker/inner/component/custom_label_edit.dart';
import 'package:tasker/inner/create_rating/create_rating.dart';
import 'package:tasker/inner/component/custom_text_field.dart';
import 'package:tasker/inner/component/custom_checkbox_list.dart';
import 'package:tasker/inner/component/custom_elevated_button.dart';
import 'package:tasker/inner/create_rostr/createRostr_controller.dart';
import 'package:tasker/inner/bottom_sheet/multi_textfield_bottom_sheet.dart';
import 'package:tasker/inner/bottom_sheet/single_textfield_bottom_sheet.dart';

class CreateRostr extends GetView<CreateRostrController> {
  const CreateRostr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBarScreen(appbarTitle: 'Create a rostr'),
      body: GetBuilder<CreateRostrController>(builder: (ctrl) {
        return SingleChildScrollView(
          child: Column(
            children: [
              12.verticalSpace,
              controller.profileImages.isEmpty
                  ? SizedBox(
                      height: 106.h,
                      width: 106.w,
                      child: Stack(
                        children: [
                          Image.asset(
                            AppImage.avatar2,
                            height: 96.h,
                            width: 96.w,
                          ),
                          Positioned(
                            bottom: 0.0,
                            right: 0.0,
                            child: SizedBox(
                              height: 38.h,
                              width: 38.w,
                              child: GestureDetector(
                                onTap: () => controller.showPicker(),
                                child: Image.asset(AppImage.camera),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : controller.enableRating
                      ? SizedBox(
                          height: 106.h,
                          child: ReorderableListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            itemCount: controller.profileImages.length,
                            itemBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                key: ValueKey(index),
                                width: 106.w,
                                child: Stack(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        controller.imageOptions(index);
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.file(
                                          controller.profileImages[index],
                                          height: 96.h,
                                          width: 96.w,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0.0,
                                      right: 0.0,
                                      child: SizedBox(
                                        height: 38.h,
                                        width: 38.w,
                                        child: GestureDetector(
                                          onTap: () =>
                                              controller.deleteImage(index),
                                          child: Image.asset(AppImage.close),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            onReorder: (oldIndex, newIndex) {
                              controller.onReordered(oldIndex, newIndex);
                            },
                          ),
                        )
                      : SizedBox(
                          height: 96.h,
                          width: 96.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.file(
                              controller.profileImages.first,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
              12.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    controller.profileImages.isEmpty
                        ? GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Add A Photo",
                              style: AppTextStyle.boldNormal.copyWith(
                                fontSize: 18.sp,
                              ),
                            ),
                          )
                        : controller.enableRating
                            ? ElevatedButton(
                                onPressed: () => controller.showPicker(),
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  padding: EdgeInsets.zero,
                                  primary: const Color(0xffCFE8FB),
                                  fixedSize: Size(193.w, 32.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0.r),
                                  ),
                                ),
                                child: Text(
                                  'Add additional photos',
                                  style: AppTextStyle.boldNormal.copyWith(
                                    fontSize: 16.sp,
                                    color: const Color(0xff41A3F0),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                    16.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Personal Info",
                          style:
                              AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
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

                    // * Ratings
                    CustomSwitchListTile(
                      activeText: 'On',
                      inactiveText: 'Off',
                      text: 'Enable ratings',
                      activeColor: Colors.red,
                      activeTextColor: AppColor.white,
                      inactiveTextColor: AppColor.c969696,
                      value: controller.enableRating,
                      onChanged: (value) {
                        controller.enableRating = value;
                        controller.calculateOverallRating();
                      },
                    ),
                    12.verticalSpace,
                    controller.enableRating
                        ? Column(
                            children: [
                              CustomLabel(
                                  label: 'Ratings',
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const CreateRating(),
                                      ),
                                    );
                                  }),
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
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Overall Rating",
                                          style: AppTextStyle.boldNormal.copyWith(
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        controller.overallRating.toString(),
                                        style: AppTextStyle.boldNormal
                                            .copyWith(
                                          fontSize: 16.sp,
                                          color: const Color(0xff00AE26),
                                        ),
                                      ),
                                      4.horizontalSpace,
                                      const Icon(
                                        Icons.grade,
                                        color: Colors.amber,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 52.h * controller.ratingsColumnNumber,
                                child: GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 12.h,
                                    crossAxisSpacing: 12.w,
                                    childAspectRatio: 4,
                                  ),
                                  itemCount: controller.rating.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: (){
                                        controller.openBottomSheet(
                                          RatingBottomSheet(superIndex: index)
                                        ).whenComplete(() {
                                          controller.calculateOverallRating();
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          color: AppColor.white,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              controller.rating[index].title,
                                              style: AppTextStyle.regularNormal
                                                  .copyWith(
                                                fontSize: 16.sp,
                                                color: AppColor.c15213B,
                                              ),
                                            ),
                                            const Icon(
                                              Icons.arrow_forward_outlined,
                                              color: AppColor.c15213B,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              12.verticalSpace,
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
                                      textController:
                                          controller.ratingNameController,
                                      onTap: () => controller.addRating(),
                                    ),
                                  );
                                },
                              ),
                              20.verticalSpace,
                            ],
                          )
                        : const SizedBox.shrink(),
                    12.verticalSpace,

                    // * Tags
                    CustomLabel(label: 'Tags', onTap: () {}),
                    16.verticalSpace,
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Wrap(
                          spacing: 12.0,
                          runSpacing: 8.0,
                          children: List.generate(
                            controller.tags.length,
                            (index) => Container(
                              padding: EdgeInsets.all(8.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.h),
                                color: Colors.white,
                              ),
                              child: Text(
                                controller.tags[index].title,
                                style: AppTextStyle.regularNormal.copyWith(
                                  fontSize: 14.sp,
                                  color: Color(controller.tags[index].color),
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
                            onTap: () => controller.addTag(),
                          ),
                        );
                      },
                    ),
                    32.verticalSpace,

                    // * Notes
                    CustomLabel(label: 'Notes', onTap: () {}),
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
                              style: AppTextStyle.boldNormal
                                  .copyWith(fontSize: 16.sp)),
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
                          Text(
                              "Write things that you consider drawbacks / red flags",
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
                            subtitle:
                                'Please, input a name of a new note block',
                            hintText: 'Notes name',
                            textController: controller.noteNameController,
                            onTap: () {},
                          ),
                        );
                      },
                    ),
                    32.verticalSpace,

                    // * Contacts
                    CustomLabel(label: 'Contacts', onTap: () {}),
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
                              style: AppTextStyle.boldNormal
                                  .copyWith(fontSize: 16.sp)),
                          Text(
                            "Add phone number or other contacts",
                            style: AppTextStyle.regularNormal.copyWith(
                                fontSize: 16.sp,
                                height: 1.6,
                                color: Colors.blue),
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
                              style: AppTextStyle.boldNormal
                                  .copyWith(fontSize: 16.sp)),
                          Text(
                            "Add a username",
                            style: AppTextStyle.regularNormal.copyWith(
                                fontSize: 16.sp,
                                height: 1.6,
                                color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    CustomElevatedButton(
                      title: 'Add Contact',
                      hasGradient: false,
                      onPressed: () {
                        controller.openBottomSheet(MultiTextFieldBottomSheet(
                          title: 'Create a Contact',
                          subtitle:
                              'Please, input a name of a new contact and a link',
                          type: BottomSheetType.CONTACT,
                          onTap: () {},
                        ));
                      },
                    ),
                    36.verticalSpace,

                    // * Dates
                    CustomLabel(label: 'Dates', onTap: () {}),
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
                      onPressed: () {
                        controller.openBottomSheet(MultiTextFieldBottomSheet(
                          title: 'Create a Date',
                          subtitle:
                              'Please, input a date, heading and description of the event ',
                          type: BottomSheetType.EVENT_DATE,
                          onTap: () {},
                        ));
                      },
                    ),
                    32.verticalSpace,

                    // * Position
                    CustomLabel(label: 'Position', onTap: () {}),
                    12.verticalSpace,
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 16.w),
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
                      padding: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 16.w),
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
                      onPressed: () {},
                    ),
                    100.verticalSpace,
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
