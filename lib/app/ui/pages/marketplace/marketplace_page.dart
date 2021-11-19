import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../pages/marketplace/components/offer_item.dart';
import '../../pages/marketplace/marketplace_controller.dart';
import '../../styles/app_colors.dart';

import '../../components/components.dart';

class MarketplacePage extends StatelessWidget {
  late final MarketplaceController controller =
      Get.find(tag: Tags.marketplaceController);

  @override
  Widget build(BuildContext context) {
    final customer = controller.appController.customer;

    return DefaultScaffold(
      showAppBar: true,
      title: NuText(
        text: Strings.default_marketplace,
        bold: true,
        size: 20,
        color: AppColors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NuText(
              text: Strings.marketplace_description,
              color: AppColors.textLight,
            ),
            SizedBox(height: 20),
            Divider(thickness: 1),
            SizedBox(height: 20),
            NuText(
              text: Strings.marketplace_today_picks,
              bold: true,
            ),
            SizedBox(height: 25),
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  ...customer.offers!.map(
                    (offer) => Column(
                      children: [
                        OfferItem(
                          offer: offer,
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
