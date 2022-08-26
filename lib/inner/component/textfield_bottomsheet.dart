import 'package:flutter/material.dart';
import 'package:tasker/app_utils/app_color.dart';

class TextFieldBottomSheet extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  const TextFieldBottomSheet({Key? key, required this.hintText, required this.textEditingController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      keyboardType: hintText == "Date of event (MM/DD/YY)" ?TextInputType.datetime :TextInputType.text,
      maxLines: 1,
      decoration: InputDecoration(
        fillColor: AppColor.cF6FAFE,
        filled: true,
        hintText:hintText,
        contentPadding: const EdgeInsets.all(12.0),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide:  const BorderSide(color: AppColor.cF6FAFE),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide:  const BorderSide(color: AppColor.cF6FAFE),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide:  const BorderSide(color: AppColor.cF6FAFE),
        ),
      ),
    );
  }
}
