import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../assets/app_images.dart';
import '../../../ui/components/components.dart';
import '../../../ui/styles/styles.dart';

import '../../constants/constants.dart';
import '../../pages/app_controller.dart';
import '../../pages/home/home_page.dart';

class PurchaseCompletedPage extends StatelessWidget {
  final AppController controller = Get.find(tag: Tags.appController);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: DefaultScaffold(
        safeArea: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AppImages.rickAndMortyDancing,
                width: 300,
              ),
              SizedBox(height: 20),
              NuText(
                text: Strings.purchase_completed_info,
                size: AppFontSize.titleBigger,
              ),
              SizedBox(height: 20),
              RoundedButton(
                text: Strings.default_close,
                onPress: () {
                  Get.offAll(() => HomePage());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
