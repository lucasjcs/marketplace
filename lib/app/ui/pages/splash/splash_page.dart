import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../util/util.dart';
import '../../pages/home/home_page.dart';
import '../../styles/app_colors.dart';
import '../splash/components/splash_scaffold.dart';

import '../../components/loading.dart';
import '../../pages/app_controller.dart';

class SplashPage extends StatelessWidget {
  final AppController controller = Get.find(tag: Tags.appController);

  @override
  Widget build(BuildContext context) {
    controller.getCustomerData(
      onSuccess: (_) {
        Get.off(() => HomePage());
      },
    );

    return SplashScaffold(
      child: Obx(() {
        if (controller.error.value) {
          Util.showGetErrorSnackBar();
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Strings.splash_wellcome,
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
        );
      }),
    );
  }
}
