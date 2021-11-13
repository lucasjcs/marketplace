import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplace_nuconta/app/ui/pages/app_controller.dart';
import '../../components/components.dart';

class HomePage extends StatelessWidget {
  final AppController controller;

  const HomePage({required this.controller});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: 'Marketplace',
      body: Obx(
        () {
          if (controller.loading.value) {
            return CircularProgressIndicator();
          }
          return Column(
            children: [
              Text('im happy'),
            ],
          );
        },
      ),
    );
  }
}
