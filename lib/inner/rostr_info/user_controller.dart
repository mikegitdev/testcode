import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasker/data/models/user_model.dart';

import '../../data/local_storage.dart';

class UserController extends GetxController {
  UserModel? _selectedUser;
  List<UserModel>? _createdUser;
  String _createUserImage = '';
  TextEditingController createUserName = TextEditingController();

  final List<UserModel> _localUser = [
    UserModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-6225_thumb.jpg", name: "user_1 hdvfgyudscdhvckgdshvyfrdfhbvgj", isSelected: false),
    UserModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-6225_thumb.jpg", name: "user_2", isSelected: false),
    UserModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-6225_thumb.jpg", name: "user_3", isSelected: false),
    UserModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-6225_thumb.jpg", name: "user_4", isSelected: false),
    UserModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-6225_thumb.jpg", name: "user_5", isSelected: false),
    UserModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-6225_thumb.jpg", name: "user_6", isSelected: false),
    UserModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-6225_thumb.jpg", name: "user_7", isSelected: false),
    UserModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-6225_thumb.jpg", name: "user_8", isSelected: false),
    UserModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-6225_thumb.jpg", name: "user_9", isSelected: false),
    UserModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-6225_thumb.jpg", name: "user_10", isSelected: false),
    UserModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-6225_thumb.jpg", name: "user_11", isSelected: false),
    UserModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-6225_thumb.jpg", name: "user_12", isSelected: false),
    UserModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-6225_thumb.jpg", name: "user_13", isSelected: false),
    UserModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-6225_thumb.jpg", name: "user_14", isSelected: false),
    UserModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-6225_thumb.jpg", name: "user_15", isSelected: false),
    UserModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-6225_thumb.jpg", name: "user_16", isSelected: false),
    UserModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-6225_thumb.jpg", name: "user_17", isSelected: false),
    UserModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-6225_thumb.jpg", name: "user_18", isSelected: false),
    UserModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-6225_thumb.jpg", name: "user_19", isSelected: false),
    UserModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-6225_thumb.jpg", name: "user_20", isSelected: false),
    UserModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-6225_thumb.jpg", name: "user_21", isSelected: false),
    UserModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-6225_thumb.jpg", name: "user_22", isSelected: false),
    UserModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-6225_thumb.jpg", name: "user_23", isSelected: false),
  ];

  UserModel? get selectedUser => _selectedUser;
  List<UserModel>? get createdUser => _createdUser;
  String get createUserImage => _createUserImage;
  List<UserModel> get localUser => _localUser;
  bool get canCreateUser => _createUserImage.isNotEmpty && createUserName.text.trim().isNotEmpty;
  bool get isCreatedExist => _createdUser != null && _createdUser!.isNotEmpty;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  loadData() async {
    List<String>? list = await SharedPreferenceService.loadStringList(
        StorageKey.EMOJIS);
    if (list != null) {
      _createdUser =
          list.map((string) => UserModel.fromJson(jsonDecode(string))).toList();
    }
    update();
  }

  void chooseUser(UserModel object) {
    for (var user in _localUser) {
      if (user.name == object.name && object.isSelected == false) {
        user.isSelected = true;
        _selectedUser = user;
      } else {
        user.isSelected = false;
      }
    }
    update();
  }

  void createUser() {
    if (canCreateUser) {
      final newUser = UserModel(image: _createUserImage,
          name: createUserName.text.trim(),
          isSelected: false);
      if (_createdUser != null) {
        _createdUser!.add(newUser);
      } else {
        _createdUser = [newUser];
      }
      update();
      List<String> stringList = _createdUser!.map((e) => jsonEncode(e.toJson()))
          .toList();
      SharedPreferenceService.storeStringList(StorageKey.USER, stringList);
    }
    cleanCreatedUser();
  }

  void cleanCreatedUser() {
    _createUserImage = '';
    createUserName.clear();
    update();
  }

  void cleanSelectedUser() {
    _selectedUser = null;
    for (var emoji in _localUser) {
      emoji.isSelected = false;
    }
    update();
  }

  Future openBottomSheet(
      {required Widget bottomSheet, bool isCleanSelectedUser = false, bool isCleanCreatedUser = false}) {
    return Get.bottomSheet(
      bottomSheet,
      isDismissible: false, // Dismiss when anywhere except the sheet pressed
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    ).whenComplete(() {
      if (isCleanSelectedUser) {
        cleanSelectedUser();
      } else if (isCleanCreatedUser) {
        cleanCreatedUser();
      }
    });
  }
}