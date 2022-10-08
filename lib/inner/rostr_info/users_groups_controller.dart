import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasker/data/local_storage.dart';
import 'package:tasker/data/models/users_groups_model.dart';
import 'package:tasker/inner/rostr_info/user_controller.dart';

class UsersGroupsController extends GetxController{
  UsersGroupModel? _selectedGroup;
  List<UsersGroupModel>? _createdGroup;
  String _createGroupImage = '';
  TextEditingController createGroupName = TextEditingController();

  final List<UsersGroupModel> _localGroup = [
    UsersGroupModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-2441_thumb.jpg", name: "Group_1", isSelected: false),
    UsersGroupModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-2442_thumb.jpg", name: "Group_2", isSelected: false),
    UsersGroupModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-2443_thumb.jpg", name: "Group_3", isSelected: false),
    UsersGroupModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-2444_thumb.jpg", name: "Group_4", isSelected: false),
    UsersGroupModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-2445_thumb.jpg", name: "Group_5", isSelected: false),
    UsersGroupModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-2446_thumb.jpg", name: "Group_6", isSelected: false),
    UsersGroupModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-2447_thumb.jpg", name: "Group_7", isSelected: false),
    UsersGroupModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-2448_thumb.jpg", name: "Group_8", isSelected: false),
    UsersGroupModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-2449_thumb.jpg", name: "Group_9", isSelected: false),
    UsersGroupModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-2415_thumb.jpg", name: "Group_10", isSelected: false),
    UsersGroupModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-2425_thumb.jpg", name: "Group_11", isSelected: false),
    UsersGroupModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-2435_thumb.jpg", name: "Group_12", isSelected: false),
    UsersGroupModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-2445_thumb.jpg", name: "Group_13", isSelected: false),
    UsersGroupModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-2455_thumb.jpg", name: "Group_14", isSelected: false),
    UsersGroupModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-2465_thumb.jpg", name: "Group_15", isSelected: false),
    UsersGroupModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-2485_thumb.jpg", name: "Group_16", isSelected: false),
    UsersGroupModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-2475_thumb.jpg", name: "Group_17", isSelected: false),
    UsersGroupModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-2495_thumb.jpg", name: "Group_18", isSelected: false),
    UsersGroupModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-2145_thumb.jpg", name: "Group_19", isSelected: false),
    UsersGroupModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-2245_thumb.jpg", name: "Group_20", isSelected: false),
    UsersGroupModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-2345_thumb.jpg", name: "Group_21", isSelected: false),
    UsersGroupModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-2445_thumb.jpg", name: "Group_22", isSelected: false),
    UsersGroupModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-2545_thumb.jpg", name: "Group_23", isSelected: false),
    UsersGroupModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-2645_thumb.jpg", name: "Group_24", isSelected: false),
    UsersGroupModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-2745_thumb.jpg", name: "Group_25", isSelected: false),
    UsersGroupModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-2845_thumb.jpg", name: "Group_26", isSelected: false),
    UsersGroupModel(image: "https://faces-img.xcdn.link/thumb-lorem-face-2945_thumb.jpg", name: "Group_27", isSelected: false),
  ];

  UsersGroupModel? get selectedUser => _selectedGroup;
  List<UsersGroupModel>? get createdGroups => _createdGroup;
  String get createdGroupImage => _createGroupImage;
  List<UsersGroupModel> get localGroup => _localGroup;
  bool get canCreateGroup => _createGroupImage.isNotEmpty && createGroupName.text.trim().isNotEmpty;
  bool get isCreatedExist => _createdGroup != null && _createdGroup!.isNotEmpty;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  loadData() async{
    List<String>? list = await SharedPreferenceService.loadStringList(
      StorageKey.GROUP);
    if (list != null) {
      _createdGroup =
          list.map((string) => UsersGroupModel.fromJson(jsonDecode(string))).toList();
    }
    update();
  }

  void chooseGroup(UsersGroupModel object) {
    for(var group in _localGroup){
      if(group.name == object.name && object.isSelected == false) {
        group.isSelected=true;
        for(var user in Get.find<UserController>().localUser){
          user.isSelected=false;
        }
        _selectedGroup = group;
      } else {
        group.isSelected = false;
      }
    }
    update();
  }

  void createGroup(){
    if(canCreateGroup){
      final newGroup = UsersGroupModel(
          image: _createGroupImage,
          name: createGroupName.text.trim(),
          isSelected: false);
      if (_createdGroup != null) {
        _createdGroup!.add(newGroup);
      } else {
        _createdGroup = [newGroup];
      }
      update();
      List<String> stringList = _createdGroup!.map((e) => jsonEncode(e.toJson())).toList();
      SharedPreferenceService.storeStringList(StorageKey.GROUP, stringList);
    }
    cleanCreatedGroup();
  }

  void cleanCreatedGroup() {
    _createGroupImage = '';
    createGroupName.clear();
    update();
  }

  void cleanSelectedGroup() {
    _selectedGroup = null;
    for (var group in _localGroup) {
      group.isSelected = false;
    }
    update();
  }

  Future openBottomSheet(
      {required Widget bottomSheet, bool isCleanSelectedGroup = false, bool isCleanCreatedGroup=false}) {
    return Get.bottomSheet(
      bottomSheet,
      isDismissible: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    ).whenComplete(() {
      if (isCleanSelectedGroup){
      cleanSelectedGroup();
    } else if (isCleanCreatedGroup) {
      cleanCreatedGroup();
    }
    });
  }
}