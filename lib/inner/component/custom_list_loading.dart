import 'package:flutter/material.dart';

class CustomListLoading extends StatelessWidget {
  const CustomListLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
