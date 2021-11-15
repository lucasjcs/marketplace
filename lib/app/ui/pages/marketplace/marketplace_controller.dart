import 'package:get/get.dart';
import 'package:marketplace_nuconta/app/domain/entity/entity.dart';
import 'package:marketplace_nuconta/app/domain/usecase/make_purshase_usecase.dart';
import '../../mixins/mixins.dart';

class MarketplaceController extends GetxController with PageState {
  final MakePurshaseUseCase makePurshaseUseCase;

  MarketplaceController({required this.makePurshaseUseCase});

  late var purshaseResponse =
      PurchaseResponse(errorMessage: '', success: false).obs;

  Future<void> makePurshase({required String offerId}) async {
    purshaseResponse.value = await this.run(
      () => makePurshaseUseCase.execute(offerId: offerId),
    );
  }
}
