import 'package:flutter/material.dart';
import 'package:marketplace_nuconta/app/ui/components/components.dart';
import 'package:marketplace_nuconta/app/ui/components/rounded_button.dart';
import 'package:marketplace_nuconta/app/ui/util/util.dart';

import '../../../../domain/entity/entity.dart';
import '../../../styles/app_colors.dart';

class OfferItem extends StatelessWidget {
  final Offer offer;
  const OfferItem({required this.offer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: 160,
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          Image.network(
            offer.product!.image!,
            width: 100,
            height: 100,
          ),
          SizedBox(height: 20),
          NuText(text: '${offer.product!.name}', center: true, maxLines: 1),
          NuText(
            text: '\$ ${Util.toMoney(offer.price!)}',
            bold: true,
            size: 14,
          ),
          SizedBox(height: 20),
          RoundedButton(text: 'Buy', fullWidth: true),
        ],
      ),
    );
  }
}
