import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplace_nuconta/app/assets/app_images.dart';
import 'package:marketplace_nuconta/app/routes/app_routes.dart';
import 'package:marketplace_nuconta/app/ui/components/components.dart';
import 'package:marketplace_nuconta/app/ui/styles/styles.dart';

class PurchaseCompletedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      safeArea: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AppImages.rickAndMortyDancing,
              width: 250,
            ),
            SizedBox(height: 10),
            NuText(
              text: 'Your purchase was successful!',
              size: AppFontSize.titleBigger,
            ),
            SizedBox(height: 10),
            RoundedButton(
              text: 'Close',
              onPress: () => Get.offAllNamed(AppRoutes.homePage),
            )
          ],
        ),
      ),
    );
  }
}
