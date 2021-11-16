import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
}
