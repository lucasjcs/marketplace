import 'package:get/get.dart';
import 'package:marketplace_nuconta/app/ui/constants/constants.dart';

import '../../../domain/usecase/make_purshase_usecase.dart';
import '../../../domain/entity/entity.dart';
import '../../mixins/mixins.dart';
import '../../pages/app_controller.dart';

class MarketplaceController extends GetxController with PageState {
  final AppController appController = Get.find(tag: Tags.appController);
  final MakePurchaseUseCase makePurchaseUseCase;

  MarketplaceController({
    required this.makePurchaseUseCase,
  });

  late Rx<PurchaseResponse?> purshaseResponse =
      PurchaseResponse(errorMessage: '', success: false).obs;

  int? getOfferIdPrice(String offerId) => this
      .appController
      .customer
      .offers!
      .firstWhere((it) => it.id == offerId)
      .price;

  Future<void> makePurchase(
    String offerId,
    Function(PurchaseStatus, {String? message}) callback,
  ) async {
    final offerPrice = getOfferIdPrice(offerId);

    if (appController.customer.balance! < offerPrice!) {
      callback(
        PurchaseStatus.error,
        message: Strings.marketplace_not_enough_balance,
      );
      return;
    }

    purshaseResponse.value = await this.run<PurchaseResponse?>(
      () => makePurchaseUseCase.execute(offerId: offerId),
    );

    if (purshaseResponse.value != null && purshaseResponse.value!.success) {
      appController.updateBalance(purshaseResponse.value!.customer!.balance!);
      callback(
        PurchaseStatus.success,
      );
    } else
      callback(
        PurchaseStatus.error,
        message: purshaseResponse.value!.errorMessage,
      );
  }
}
