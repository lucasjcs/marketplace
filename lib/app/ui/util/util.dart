import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marketplace_nuconta/app/ui/constants/constants.dart';
import 'package:marketplace_nuconta/app/ui/constants/purchase_status.dart';
import 'package:marketplace_nuconta/app/ui/pages/marketplace/purchase_completed_page.dart';

import '../components/components.dart';
import '../styles/styles.dart';

class Util {
  static String toMoney(int value) {
    final currency = NumberFormat.currency(symbol: '', locale: 'eu');
    return currency.format(value);
  }

  static Future<dynamic> getDialog({
    required String title,
    required String subtitle,
    bool loading = false,
    String? confirm = '',
    String? cancel,
    Function? actionConfirm,
    Function? actionCancel,
  }) {
    return Get.defaultDialog(
      titlePadding: EdgeInsets.only(top: 25),
      contentPadding: EdgeInsets.all(15),
      radius: 8,
      title: title,
      middleText: subtitle,
      confirm: confirm != null
          ? RoundedButton(
              loading: loading,
              text: confirm,
              onPress: () {
                if (actionConfirm != null) actionConfirm();
              },
            )
          : null,
      cancel: cancel != null
          ? RoundedButton(
              text: cancel,
              color: AppColors.disabled,
              onPress: () => Get.back(),
            )
          : null,
    );
  }

  static void showGetErrorSnackBar({
    String message = Strings.default_error_message,
  }) {
    return Get.snackbar(
      Strings.default_error,
      message,
      icon: Icon(Icons.warning, color: AppColors.white),
      duration: Duration(seconds: 4),
      backgroundColor: AppColors.lightBrown,
      colorText: AppColors.white,
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 8,
      margin: EdgeInsets.all(10),
    );
  }

  static void onPurchaseFinishes(
    PurchaseStatus status, {
    String? message = Strings.default_error_message,
  }) {
    if (status == PurchaseStatus.error) {
      showGetErrorSnackBar(message: message!);
    } else {
      Get.offAll(() => PurchaseCompletedPage());
    }
  }
}
