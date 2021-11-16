import 'package:get/get.dart';

import '../../pages/app_controller.dart';
import '../../pages/marketplace/purchase_completed.dart';
import '../../../domain/entity/entity.dart';
import '../../../domain/usecase/make_purshase_usecase.dart';
import '../../mixins/mixins.dart';

class MarketplaceController extends GetxController with PageState {
  final MakePurchaseUseCase makePurchaseUseCase;
  final AppController appController;

  MarketplaceController({
    required this.makePurchaseUseCase,
    required this.appController,
  });

  late Rx<PurchaseResponse?> purshaseResponse =
      PurchaseResponse(errorMessage: '', success: false).obs;

  Future<void> makePurchase({required String offerId}) async {
    purshaseResponse.value = await this.run<PurchaseResponse?>(
      () => makePurchaseUseCase.execute(offerId: offerId),
    );

    if (purshaseResponse.value != null && purshaseResponse.value!.success) {
      appController.customer.value!.balance =
          purshaseResponse.value!.customer!.balance;
      Get.off(() => PurchaseCompletedPage());
    } else {
      Get.back();
      Get.snackbar(
          'Error',
          purshaseResponse.value!.errorMessage ??
              'something went wrong, please try again.');
    }
  }
}
