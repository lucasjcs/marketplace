import 'package:flutter_test/flutter_test.dart';
import 'package:marketplace_nuconta/app/domain/entity/entity.dart';
import 'package:marketplace_nuconta/app/domain/gateways/gateways.dart';
import 'package:marketplace_nuconta/app/domain/usecase/make_purshase_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../mock/generated/generated_mocks.mocks.dart';
import '../../mock/purshase_data_mock.dart';
import '../test_utils/test_utils.dart';

void main() {
  late MakePurchaseGateway makePurchaseGateway;
  late MakePurchaseUseCase makePurchaseUseCase;

  setUp(() {
    makePurchaseGateway = MockMakePurchaseGateway();
    makePurchaseUseCase = MakePurchaseUseCase(
      makePurchaseGateway: makePurchaseGateway,
    );
  });

  test('should make a purshase with success', () async {
    when(makePurchaseGateway.makePurchase(offerId: 'some-id')).thenAnswer(
      (_) async => TestUtils.makePurshaseResponse(PurshaseDataMock.withSuccess),
    );

    final response = await makePurchaseUseCase.execute(offerId: 'some-id');

    expect(response is PurchaseResponse, true);
    expect(response!.customer!.balance, 995000);
    expect(response.success, true);
    expect(response.errorMessage, '');
  });

  test('should make a purshase with expired item', () async {
    when(makePurchaseGateway.makePurchase(offerId: 'some-id')).thenAnswer(
      (_) async => TestUtils.makePurshaseResponse(PurshaseDataMock.expired),
    );

    final response = await makePurchaseUseCase.execute(offerId: 'some-id');

    expect(response is PurchaseResponse, true);
    expect(response!.customer!.balance, 1000000);
    expect(response.success, false);
    expect(response.errorMessage, 'Offer expired');
  });

  test('should make a purshase with success', () async {
    when(makePurchaseGateway.makePurchase(offerId: 'some-id')).thenAnswer(
      (_) async => TestUtils.makePurshaseResponse(PurshaseDataMock.notMoney),
    );

    final response = await makePurchaseUseCase.execute(offerId: 'some-id');

    expect(response is PurchaseResponse, true);
    expect(response!.customer!.balance, 1000000);
    expect(response.success, false);
    expect(response.errorMessage, 'You don\'t have that much money.');
  });
}
