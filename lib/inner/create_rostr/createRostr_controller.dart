import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateRostrController extends GetxController {
  bool enableRating = false;
  File? image;
  List<File> fileList = [];

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
  ) async {
    // DioService()
    //     .postFile(api: Apis.apiPostAttachment, file: file!)
    //     .then((value) => {
    //   if (value != null)
    //     {
    //       Log.i(value),
    //       postImageModel = postImageModelFromJson(value),
    //       postApiFile(),
    //     }
    // });
  }

  void deleteIndex(int index) {
    fileList.removeAt(index);
    update();
  }
}
