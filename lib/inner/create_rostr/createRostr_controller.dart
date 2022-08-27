import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasker/app_utils/app_color.dart';
import 'package:tasker/data/local_storage.dart';
import 'package:tasker/data/models/rating_model.dart';
import 'package:tasker/data/models/tag_model.dart';
import 'package:tasker/inner/bottom_sheet/back_button.dart';
import 'package:tasker/inner/local_back.dart';

enum BottomSheetType{
  EVENT_DATE,
  CONTACT,
}

class CreateRostrController extends GetxController {
  /// Fields

  bool _enableRating = false;
  File? _image;
  List<File> _profileImages = [];

  List<Rating> _ratings = defaultRatings;
  List<Rating>? _createdRatings;
  List<Tag> _tags = defaultTags;
  List<Tag>? _createdTags;


  final personNameController = TextEditingController();
  final personBirthDateController = TextEditingController();
  final personPlaceController = TextEditingController();

  // * Used in Bottom Sheets
  final ratingNameController = TextEditingController();
  final noteNameController = TextEditingController();
  final tagNameController = TextEditingController();
  final contactNameController = TextEditingController();
  final contactLinkController = TextEditingController();
  final eventDateController = TextEditingController();
  final eventHeadingController = TextEditingController();
  final eventDescriptionController = TextEditingController();

  int? _newTagColor;
  final List<int> tagColors = [
    AppColor.cE50101.value,
    AppColor.c83C3F5.value,
    AppColor.c00AE26.value,
    AppColor.cFF9900.value,
    AppColor.c660099.value,
    AppColor.c1372FF.value,
    AppColor.cA09000.value,
    AppColor.c222222.value,
    AppColor.c969696.value,
  ];

  // List of items in our dropdown menu
  final List<String> _sectionItems = [
    'Choose a rostr type',
    'Dating',
    'Friends',
    'Professional',
  ];

  // List of items in our dropdown menu
  final List<String> _folderItems = [
    'Choose a folder',
    'Starting Lineup',
    'Reserves',
  ];

  /// Getters and Setters

  bool get enableRating => _enableRating;
  List<File> get profileImages => _profileImages;

  List<Rating> get rating => _ratings;
  List<Tag> get tags => _tags;

  List<String> get sectionItems => _sectionItems;
  List<String> get folderItems => _folderItems;
  int get ratingsColumnNumber => (_ratings.length/ 2).ceil();
  int? get newTagColor => _newTagColor;


  set enableRating (bool newValue){
    if(_enableRating != newValue){
      _enableRating = newValue;
      update();
    }
  }
  set newTagColor(int? newColor){
    if(tagColors.contains(newColor) && _newTagColor != newColor){
      _newTagColor = newColor;
      update();
    }
  }


  @override
  void onInit() {
    /// Load Data From Local
    loadData();
    super.onInit();
  }

  /// Methods

  _imgFromCamera() async {
    XFile? images = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);
    if (images != null) {
    _image = File(images.path);
      update();
    } else {
      log("Error while loading image");
    }
  }
  _imgFromGallery() async {
    XFile? images = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (images != null) {
      _image = File(images.path);
      if (_image != null) {
        _profileImages.insert(0, _image!);
        update();
      }
      update();
    } else {
      log("Error while loading image");
    }
  }
  void showPicker() {
    Get.bottomSheet(
        Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CustomBackButton(),
          12.verticalSpace,
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
              BorderRadius.vertical(top: Radius.circular(25.r)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 5.h,
                    width: 64.w,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                24.verticalSpace,
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Photo Library'),
                  onTap: () {
                    _imgFromGallery();
                    Get.back();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
        isDismissible: false,
    );
  }
  void imageOptions(int index) {
    Get.bottomSheet(
        Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CustomBackButton(),
          12.verticalSpace,
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
              BorderRadius.vertical(top: Radius.circular(25.r)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 5.h,
                    width: 64.w,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                24.verticalSpace,
                ListTile(
                  leading: const Icon(CupertinoIcons.profile_circled),
                  title: const Text('Set as Main'),
                  onTap: () {
                    onReordered(index, 0);
                    Get.back();
                  },
                ),
                ListTile(
                  leading: const Icon(CupertinoIcons.trash_circle),
                  title: const Text('Delete'),
                  onTap: () {
                    _profileImages.removeAt(index);
                    update();
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
        isDismissible: false,
    );
  }

  void deleteImage(int index) {
    _profileImages.removeAt(index);
    update();
  }

  Future openBottomSheet(Widget bottomSheet){
    return Get.bottomSheet(
      bottomSheet,
      isDismissible: false,
      isScrollControlled: true,
    );
  }

  // void createNoteFunction() async{
  //   String? noteTitle = noteTitleController.text.trim().toString();
  //   String? noteSubtitle = noteSubtitleController.text.trim().toString();
  //   if (noteSubtitle.isNotEmpty && noteSubtitle.isNotEmpty) {
  //     CreateNote createNote = CreateNote(noteTitle: noteTitle, noteSubtitle: noteSubtitle);
  //     createNoteList.add(createNote);
  //     noteTitleController.text  = "";
  //     noteTitleController.text  = "";
  //     Get.back();
  //     update();
  //   }
  // }
  // void createTagFunction() {
  //   Color color = listColor[selectedIndex];
  //   String tag = tagController.text.trim().toString();
  //   Tag tagObject = Tag(title: tag, color: color);
  //   tags.add(tagObject);
  //   update();
  //   selectedIndex = -1;
  //   tagController.text = "";
  //   Get.back();
  //
  // }

  // void createDateFunction() {
  //   String date = dateController.text.trim().toString();
  //   String headname = headingNameController.text.trim().toString();
  //   String description = descriptionController.text.trim().toString();
  //   if(date.isNotEmpty && headname.isNotEmpty && description.isNotEmpty){
  //     CreateDate createDate = CreateDate(date: date, description: description, headName: headname);
  //     createDateList.add(createDate);
  //     update();
  //     Get.back();
  //   }
  //
  //   update();
  //   dateController.text = "";
  //   headingNameController.text = "";
  //   descriptionController.text = "";
  //   Get.back();
  //
  // }

  // void chooseIndex(int index) {
  //   selectedIndex = index;
  //   update();
  // }

  void onReordered(int oldIndex, int newIndex){
    final index = newIndex > oldIndex ? newIndex - 1 : newIndex;
    final image = _profileImages.removeAt(oldIndex);
    _profileImages.insert(index, image);
    update();
  }

  Future<void> loadData() async{
    // * Ratings
    List<String>? ratingsStringList =  await SharedPreferenceService.loadStringList(StorageKey.RATINGS);
    if(ratingsStringList != null){
      _createdRatings = ratingsStringList.map((string) => Rating.fromJson(jsonDecode(string))).toList();
      _ratings = _createdRatings!;
    }

    // * Tags
    List<String>? tagsStringList =  await SharedPreferenceService.loadStringList(StorageKey.TAGS);
    if(tagsStringList != null){
      _createdTags = tagsStringList.map((string) => Tag.fromJson(jsonDecode(string))).toList();
      _tags = _createdTags!;
    }
    update();
  }

  void addRating(){
    print('ADD RATING : ${_ratings.length}');
    String title = ratingNameController.text.trim();
    if(title.isNotEmpty){
      Rating newRating = Rating(title: title);
      _ratings.add(newRating);
      ratingNameController.clear();
      update();
      List<String> ratingsStringList = _ratings.map((e) => jsonEncode(e.toJson())).toList();
      SharedPreferenceService.storeStringList(StorageKey.RATINGS, ratingsStringList);
    }
    Get.back();
  }

  void addTag(){
    String title = tagNameController.text.trim();

    if(title.isNotEmpty && _newTagColor != null){
      Tag newTag = Tag(title: title, color: _newTagColor!);
      _tags.add(newTag);
      tagNameController.clear();
      _newTagColor = null;
      update();
      List<String> tagsStringList = _tags.map((e) => jsonEncode(e.toJson())).toList();
      SharedPreferenceService.storeStringList(StorageKey.TAGS, tagsStringList);
    }
    Get.back();
  }

}