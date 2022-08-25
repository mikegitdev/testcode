import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasker/inner/bottom_sheet/edit_alert/bindings/edit_alert_binding.dart';
import 'package:tasker/inner/bottom_sheet/edit_alert/views/edit_alert_view.dart';
import 'package:tasker/inner/create_rostr/createRostr_binding.dart';
import 'package:tasker/inner/create_rostr/create_rostr.dart';

import 'package:tasker/inner/rostr_info/inner_binding.dart';
import 'package:tasker/inner/rostr_info/inner_screen.dart';

import 'app_route_name.dart';

/// Library

class AppRouter {
  static List<GetPage> onGeneratePage() {
    return [
      /// intro
      GetPage(
        name: '/${AppRouteName.rostrInner}',
        bindings: [InnerBinding()],
        page: () => const InnerScreen(),
      ),
      GetPage(
        name: '/${AppRouteName.createRostr}',
        bindings: [CreateRostrBinding()],
        page: () =>  CreateRostr(),
      ),

      GetPage(
        name: '/${AppRouteName.editAlert}',
        bindings: [EditAlertBinding()],
        page: () => const EditAlertView(),
      ),
    ];
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
          body: Center(
        child: Text('Error Route'),
      ));
    });
  }
}
