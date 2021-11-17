import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplace_nuconta/app/ui/constants/constants.dart';
import 'package:marketplace_nuconta/app/ui/pages/marketplace/marketplace_page.dart';
import 'package:marketplace_nuconta/app/ui/styles/styles.dart';

import '../../components/rounded_button.dart';
import '../../styles/app_colors.dart';
import '../../util/util.dart';

import '../../pages/app_controller.dart';
import '../../components/components.dart';

class HomePage extends StatelessWidget {
  final AppController controller = Get.find(tag: Tags.appController);

  @override
  Widget build(BuildContext context) {
    final customer = controller.customer;
    return DefaultScaffold(
      showAppBar: true,
      title: NuText(
        size: AppFontSize.appBarTitle,
        bold: true,
        text: '${Strings.default_hello}, ${customer.name}',
        color: AppColors.white,
      ),
      body: Obx(
        () {
          if (controller.loading.value) {
            return Align(
              alignment: Alignment.topCenter,
              child: Loading(),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NuText(
                text: Strings.default_balance,
                size: 18,
              ),
              SizedBox(height: 10),
              NuText(
                text: '\$ ${Util.toMoney(customer.balance!)}',
                bold: true,
                size: 18,
              ),
              SizedBox(height: 10),
              SizedBox(height: 30),
              Divider(thickness: 1),
              SizedBox(height: 25),
              NuText(
                text: Strings.home_discover_more,
                size: 18,
                bold: true,
              ),
              SizedBox(height: 25),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.lightGray,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NuText(
                      text: Strings.home_nu_marketplace,
                      size: 18,
                      bold: true,
                    ),
                    SizedBox(height: 10),
                    NuText(
                      text: Strings.home_discover_marketplace,
                      color: AppColors.textLight,
                    ),
                    SizedBox(height: 20),
                    RoundedButton(
                      onPress: () {
                        Get.to(() => MarketplacePage());
                      },
                      text: Strings.default_discover,
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
