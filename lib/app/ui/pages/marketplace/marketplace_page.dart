import 'package:flutter/material.dart';
import 'package:marketplace_nuconta/app/domain/entity/entity.dart';
import 'package:marketplace_nuconta/app/ui/pages/marketplace/components/offer_item.dart';
import 'package:marketplace_nuconta/app/ui/styles/app_colors.dart';

import '../../components/components.dart';
import '../app_controller.dart';

class Marketplace extends StatelessWidget {
  final AppController controller;

  const Marketplace({required this.controller});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      showAppBar: true,
      title: NuText(
        text: 'Marketplace',
        bold: true,
        size: 20,
        color: AppColors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NuText(
              text: 'Enjoy the legendary items we\'ve separated for you',
              color: AppColors.textLight,
            ),
            SizedBox(height: 20),
            Divider(thickness: 1),
            SizedBox(height: 20),
            NuText(
              text: 'Today\'s picks',
              bold: true,
            ),
            SizedBox(height: 25),
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  ...controller.customer.value!.offers!.map(
                    (offer) => Column(
                      children: [
                        OfferItem(offer: offer),
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
