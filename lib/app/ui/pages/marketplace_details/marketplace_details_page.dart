import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:marketplace_nuconta/app/routes/app_routes.dart';
import 'package:marketplace_nuconta/app/ui/util/util.dart';

import '../../../domain/entity/entity.dart';
import '../../components/components.dart';
import '../../styles/app_colors.dart';
import '../../styles/styles.dart';

class MarketPlaceDetails extends StatelessWidget {
  final Offer offer;
  final Function buy;

  const MarketPlaceDetails({required this.offer, required this.buy});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      showAppBar: true,
      title: NuText(
        text: offer.product!.name!,
        color: AppColors.white,
        bold: true,
        size: AppFontSize.appBarTitle,
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NuText(
                  text: offer.product!.name!,
                  bold: true,
                  size: AppFontSize.titleBigger,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Image.network(
                    offer.product!.image!,
                    width: 150,
                    height: 150,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Money(
                  value: Util.toMoney(offer.price!),
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
                  text: 'Description',
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
                  child: NuText(text: offer.product!.description!),
                ),
                SizedBox(height: 20),
                Expanded(child: Container()),
                RoundedButton(
                  text: 'Buy',
                  fullWidth: true,
                  onPress: () async {
                    await Util.getDialog(
                      title: 'Do you want to complete the purchase?',
                      subtitle:
                          'You are buying a ${offer.product!.name}, want to continue?',
                      confirm: 'Yes, buy now',
                      cancel: 'Cencel',
                      actionConfirm: () {
                        //Make a purshas

                        Get.offAllNamed(AppRoutes.homePage);
                      },
                      actionCancel: () => Get.back(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
