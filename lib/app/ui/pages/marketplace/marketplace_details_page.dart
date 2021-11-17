import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../pages/marketplace/marketplace_controller.dart';
import '../../util/util.dart';

import '../../../domain/entity/entity.dart';
import '../../components/components.dart';
import '../../styles/app_colors.dart';
import '../../styles/styles.dart';

class MarketPlaceDetails extends StatelessWidget {
  final MarketplaceController controller =
      Get.find(tag: Tags.marketplaceController);

  final Offer offer;

  MarketPlaceDetails({
    required this.offer,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      showAppBar: true,
      title: NuText(
        text: offer.product.name,
        color: AppColors.white,
        bold: true,
        size: AppFontSize.appBarTitle,
      ),
      body: Obx(
        () {
          return CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NuText(
                      text: offer.product.name,
                      bold: true,
                      size: AppFontSize.titleBigger,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Image.network(
                        offer.product.image,
                        width: 150,
                        height: 150,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Money(
                      value: Util.toMoney(offer.price),
                      color: AppColors.purple,
                      size: AppFontSize.titleBigger,
                      bold: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(thickness: 1),
                    SizedBox(height: 20),
                    NuText(
                      text: Strings.default_description,
                      bold: true,
                      size: AppFontSize.titleBigger,
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: AppColors.lightGray,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: NuText(text: offer.product.description),
                    ),
                    SizedBox(height: 20),
                    Expanded(child: Container()),
                    RoundedButton(
                      loading: controller.loading.value,
                      text: Strings.default_buy,
                      fullWidth: true,
                      onPress: () async {
                        await Util.getDialog(
                          title: Strings.marketplace_dialog_title,
                          subtitle: Strings.marketplaceDialogSubtitle(
                            offer.product.name,
                          ),
                          confirm: Strings.marketplace_dialog_buy_now,
                          cancel: Strings.default_cancel,
                          actionConfirm: () async {
                            Get.back();
                            await controller.makePurchase(offer.id, (
                              status, {
                              message,
                            }) {
                              Util.onPurchaseFinishes(status, message: message);
                            });
                          },
                          actionCancel: () => Get.back(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
