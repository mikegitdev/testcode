import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasker/data/models/direct_model.dart';
import 'package:tasker/data/models/rating_model.dart';
import 'package:tasker/inner/local_back.dart';

enum BottomSheetType {
  EVENT_DATE,
  CONTACT,
}

class CreateRostrController extends GetxController {
  /// Fields

  bool enableRating = false;
  PageController pageController = PageController(initialPage: 0);
  int currentTap = 0;
  int directIndex = -1;
  int groupIndex = -1;
  int pageIndex = 0;


  File? image;
  List<File> fileList = [];
  List<Ratings> rating = defaultRatings;

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

  Color? _newTagColor;
  final List<Color> tagColors = const [
    Color(0xffE50101),
    Color(0xff83C3F5),
    Color(0xff00AE26),
    Color(0xffFF9900),
    Color(0xff660099),
    Color(0xff1372FF),
    Color(0xffA09000),
    Color(0xff222222),
    Color(0xff969696),
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

  List<String> get sectionItems => _sectionItems;

  List<String> get folderItems => _folderItems;

  int get ratingsColumnNumber => (rating.length / 2).ceil();

  Color? get selectedTagColor => _newTagColor;

  set newTagColor(Color? newColor) {
    if (tagColors.contains(newColor) && _newTagColor != newColor) {
      _newTagColor = newColor;
      update();
    }
  }

  /// Methods

  void changeRating(bool value) {
    enableRating = value;
    update();
    log("enableRating   $enableRating");
  }

  _imgFromCamera() async {
    XFile? images = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);
    if (images != null) {
      image = File(images.path);
      await apiPostImage(image);
      update();
    } else {
      log("Error while loading image");
    }
  }

  _imgFromGallery() async {
    XFile? images = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (images != null) {
      image = File(images.path);
      if (image != null) {
        fileList.add(image!);
        log("FileList   ${fileList.length}");
        update();
      }
      await apiPostImage(image);
      update();
    } else {
      log("Error while loading image");
    }
  }

  void showPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        builder: (BuildContext bc) {
          return Column(
            children: <Widget>[
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
          );
        });
  }

  Future<void> apiPostImage(File? file) async {}

  void deleteIndex(int index) {
    fileList.removeAt(index);
    update();
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

  Future openBottomSheet(Widget bottomSheet) {
    return Get.bottomSheet(
      bottomSheet,
      isDismissible: false,
      isScrollControlled: true,
    );
  }

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

  void changeDirectIndex(int index) {

    index== directIndex ? directIndex = -1 : directIndex = index  ;
    update();
  }

  void changeGroupIndex(int index) {
    index == groupIndex ? groupIndex = -1 : groupIndex = index  ;
    update();
  }
  void changePageIndex(int index) {
    pageIndex = index;
    update();
   pageController.animateToPage(pageIndex,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut);
  }
}


