import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplace_nuconta/app/routes/app_routes.dart';
import 'package:marketplace_nuconta/app/ui/styles/app_colors.dart';
import '../splash/components/splash_scaffold.dart';

import '../../components/loading.dart';
import '../../pages/app_controller.dart';

class SplashPage extends StatelessWidget {
  final AppController controller;

  const SplashPage({required this.controller});

  @override
  Widget build(BuildContext context) {
    controller.getCustomerData(
      onSuccess: () => Get.offNamed(AppRoutes.homePage),
      // onError: () => Get.toNamed(AppRoutes.errorPage);
    );

    return SplashScaffold(
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the purple side',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 30),
            controller.loading.value
                ? Loading(
                    color: AppColors.white,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
