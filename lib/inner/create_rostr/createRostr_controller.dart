import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasker/inner/helper_class.dart';
import 'package:tasker/inner/local_back.dart';

class CreateRostrController extends GetxController {
  bool enableRating = false;
  File? image;
  List<File> fileList = [];
  int selectedIndex = -1;
  List<CreateNote> createNoteList = [];
  List<CreateTag> createTagList = [];
  List<CreateDate> createDateList = [];
  List<Color> listColor = [Colors.purpleAccent,Colors.green,Colors.blue,Colors.deepOrangeAccent,Colors.tealAccent,Colors.red,Colors.greenAccent,];
  TextEditingController noteTitleController = TextEditingController();
  TextEditingController noteSubtitleController = TextEditingController();
  TextEditingController tagController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController headingNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void changeRating(bool value) {
    enableRating = value;
    update();
    enableRating ? enableRating == false : enableRating == true;
    update();
    log("enableRating   $enableRating");
  }

  ///Picker Camera
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

  ///Picker Gallery
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

  ///Show Picker
  void showPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
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
            ),
          );
        });
  }

  Future<void> apiPostImage(
    File? file,
  ) async {}

  void deleteIndex(int index) {
    fileList.removeAt(index);
    update();
  }

  void createNoteFunction() async{
    String? noteTitle = noteTitleController.text.trim().toString();
    String? noteSubtitle = noteSubtitleController.text.trim().toString();
    if (noteSubtitle.isNotEmpty && noteSubtitle.isNotEmpty) {
      CreateNote createNote = CreateNote(noteTitle: noteTitle, noteSubtitle: noteSubtitle);
      createNoteList.add(createNote);
      noteTitleController.text  = "";
      noteTitleController.text  = "";
      Get.back();
      update();
    }
  }


  Future openBottomSheet({required Widget bottomSheet, }){
    return Get.bottomSheet(
      bottomSheet,
      isDismissible: false, // Dismiss when anywhere except the sheet pressed
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

  void createTagFunction() {
    Color color = listColor[selectedIndex];
    String tag = tagController.text.trim().toString();
    Tags tagObject = Tags(lookTitle: tag, lookColor: color);
    tags.add(tagObject);
    update();
    selectedIndex = -1;
    tagController.text = "";
    Get.back();

  }

  void createDateFunction() {
    String date = dateController.text.trim().toString();
    String headname = headingNameController.text.trim().toString();
    String description = descriptionController.text.trim().toString();
    if(date.isNotEmpty && headname.isNotEmpty && description.isNotEmpty){
      CreateDate createDate = CreateDate(date: date, description: description, headName: headname);
      createDateList.add(createDate);
      update();
      Get.back();
    }

    update();
    dateController.text = "";
    headingNameController.text = "";
    descriptionController.text = "";
    Get.back();

  }

  void chooseIndex(int index) {
    selectedIndex = index;
    update();
  }
}

class CreateNote {
  String noteTitle;
  String noteSubtitle;

  CreateNote({required this.noteTitle, required this.noteSubtitle});
}

class CreateTag{
  String tagName;
  Color color;

  CreateTag({required this.tagName, required this.color});

}
class CreateDate{
  String headName;
  String date;
  String description;

  CreateDate({required this.headName, required this.date,required this.description});

}
