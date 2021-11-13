import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../components/rounded_button.dart';
import '../../styles/app_colors.dart';
import '../../util/util.dart';

import '../../pages/app_controller.dart';
import '../../components/components.dart';

class HomePage extends StatelessWidget {
  final AppController controller;

  const HomePage({required this.controller});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      showAppBar: true,
      title: NuText(
        text: 'Hello, ${controller.customer.value!.name}',
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
                text: 'Balance',
                size: 18,
              ),
              SizedBox(height: 10),
              NuText(
                text: '\$ ${Util.toMoney(controller.customer.value!.balance!)}',
                bold: true,
                size: 18,
              ),
              SizedBox(height: 10),
              SizedBox(height: 30),
              Divider(thickness: 1),
              SizedBox(height: 25),
              NuText(
                text: 'Discover more',
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
                      text: 'Nu Marketplace',
                      size: 18,
                      bold: true,
                    ),
                    SizedBox(height: 10),
                    NuText(
                      text:
                          'Discover nubank marketplace with exclusive offers for you',
                      color: AppColors.textLight,
                    ),
                    SizedBox(height: 20),
                    RoundedButton(
                      onPress: () {
                        Get.toNamed(AppRoutes.marketplace);
                      },
                      text: 'Discover',
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
