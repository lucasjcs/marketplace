import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../../assets/app_images.dart';
import '../../../../domain/entity/entity.dart';
import '../../../components/components.dart';
import '../../../components/rounded_button.dart';
import '../../../styles/styles.dart';
import '../../../util/util.dart';
import '../../../styles/app_colors.dart';

import '../marketplace_details_page.dart';

class OfferItem extends StatelessWidget {
  final Offer offer;

  const OfferItem({required this.offer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: [
              FadeInImage.assetNetwork(
                placeholder: AppImages.loadingDots,
                image: offer.product.image,
                width: 80,
                height: 80,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: NuText(
                        text: '${offer.product.name}',
                        center: true,
                        maxLines: 1),
                  ),
                  Money(
                    value: Util.toMoney(offer.price),
                    bold: true,
                    size: AppFontSize.standard,
                    color: AppColors.purple,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          RoundedButton(
            text: 'See more',
            fullWidth: true,
            onPress: () {
              Get.to(
                () => MarketPlaceDetails(
                  offer: offer,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
