import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:marketplace_nuconta/app/domain/entity/entity.dart';
import 'package:marketplace_nuconta/app/domain/usecase/make_purshase_usecase.dart';
import 'package:marketplace_nuconta/app/ui/constants/constants.dart';
import 'package:marketplace_nuconta/app/ui/pages/app_controller.dart';
import 'package:marketplace_nuconta/app/ui/pages/marketplace/marketplace_controller.dart';
import 'package:mockito/mockito.dart';

import '../../mock/generated/generated_mocks.mocks.dart';
import '../../mock/purchase_data_mock.dart';
import '../test_utils/test_utils.dart';

void main() {
  late MakePurchaseUseCase useCaseMock;
  late AppController appController;

  setUp(() {
    useCaseMock = MockMakePurchaseUseCase();
    appController = AppController(
      getCustomerDataUseCase: MockGetCustomerDataUseCase(),
    );

    Get.put(
      appController,
      tag: 'app_controller',
    );

    Get.put(
      MarketplaceController(
        makePurchaseUseCase: useCaseMock,
      ),
      tag: 'marketplace_controller',
    );
  });

  test('shoud make a purchase correctly', () async {
    appController.customer = await TestUtils.makeCustomerData();

    final MarketplaceController controller =
        Get.find(tag: 'marketplace_controller');

    when(useCaseMock.execute(offerId: 'offer/portal-gun')).thenAnswer(
      (_) async => TestUtils.makePurshaseResponse(PurchaseDataMock.withSuccess),
    );

    await controller.makePurchase('offer/portal-gun', (status, {message}) {
      expect(controller.purshaseResponse.value is PurchaseResponse, true);
      expect(controller.loading.value, false);
      expect(status == PurchaseStatus.success, true);
      expect(controller.error.value, false);
    });
  });
}
