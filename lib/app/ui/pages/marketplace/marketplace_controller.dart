import 'package:get/get.dart';
import '../../../domain/entity/entity.dart';
import '../../../domain/usecase/make_purshase_usecase.dart';
import '../../mixins/mixins.dart';

class MarketplaceController extends GetxController with PageState {
  final MakePurchaseUseCase makePurchaseUseCase;

  MarketplaceController({required this.makePurchaseUseCase});

  late var purshaseResponse =
      PurchaseResponse(errorMessage: '', success: false).obs;

  Future<void> makePurchase({required String offerId}) async {
    purshaseResponse.value = await this.run(
      () => makePurchaseUseCase.execute(offerId: offerId),
    );
  }
}
