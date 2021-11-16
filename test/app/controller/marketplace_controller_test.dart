import 'package:flutter_test/flutter_test.dart';
import 'package:marketplace_nuconta/app/domain/entity/entity.dart';
import 'package:marketplace_nuconta/app/domain/usecase/make_purshase_usecase.dart';
import 'package:marketplace_nuconta/app/ui/pages/marketplace/marketplace_controller.dart';
import 'package:mockito/mockito.dart';

import '../../mock/generated/generated_mocks.mocks.dart';
import '../../mock/purshase_data_mock.dart';
import '../test_utils/test_utils.dart';

void main() {
  late MakePurchaseUseCase useCaseMock;
  late MarketplaceController controller;

  setUp(() {
    useCaseMock = MockMakePurshaseUseCase();
    controller = MarketplaceController(makePurchaseUseCase: useCaseMock);
  });

  test('shoud make a purchase correctly', () async {
    when(useCaseMock.execute(offerId: 'some-id')).thenAnswer(
      (_) async => TestUtils.makePurshaseResponse(PurshaseDataMock.withSuccess),
    );

    await controller.makePurchase(offerId: 'some-id');

    expect(controller.purshaseResponse.value is PurchaseResponse, true);
    expect(controller.loading.value, false);
    expect(controller.error.value, false);
  });

  test('shoud return an error when offer expired', () async {
    when(useCaseMock.execute(offerId: 'some-id')).thenAnswer(
      (_) async => TestUtils.makePurshaseResponse(PurshaseDataMock.expired),
    );

    await controller.makePurchase(offerId: 'some-id');

    expect(controller.purshaseResponse.value is PurchaseResponse, true);
    expect(controller.purshaseResponse.value.errorMessage, 'Offer expired');
    expect(controller.purshaseResponse.value.success, false);
  });

  test('shoud return an error when don\'t have enough balance', () async {
    when(useCaseMock.execute(offerId: 'some-id')).thenAnswer(
      (_) async => TestUtils.makePurshaseResponse(PurshaseDataMock.notMoney),
    );

    await controller.makePurchase(offerId: 'some-id');

    expect(controller.purshaseResponse.value is PurchaseResponse, true);
    expect(
      controller.purshaseResponse.value.errorMessage,
      'You don\'t have that much money.',
    );
    expect(controller.purshaseResponse.value.success, false);
  });
}
