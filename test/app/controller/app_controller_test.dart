import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:marketplace_nuconta/app/domain/entity/entity.dart';
import 'package:marketplace_nuconta/app/domain/model/model.dart';
import 'package:marketplace_nuconta/app/domain/usecase/get_customer_data_usecase.dart';
import 'package:marketplace_nuconta/app/ui/pages/app_controller.dart';
import 'package:mockito/mockito.dart';

import '../../mock/customer_data_mock.dart';
import '../../mock/generated/generated_mocks.dart';

void main() {
  late GetCustomerDataUseCase useCaseMock;
  late AppController controller;

  setUp(() {
    useCaseMock = MockGetCustomerDataUseCase();
    controller = AppController(getCustomerDataUseCase: useCaseMock);
  });

  test('shoud request customer data correctly', () async {
    final data = jsonDecode(
      CustomerDataMock.customerData,
    )['data']['viewer'];

    when(useCaseMock.execute()).thenAnswer(
      (_) async => CustomerModel.fromJson(data),
    );

    await controller.getCustomerData();

    expect(controller.customer.value is CustomerModel, true);
    expect(controller.loading.value, false);
    expect(controller.error.value, false);
  });

  test('shoud return an error when request customer data', () async {
    when(useCaseMock.execute()).thenThrow(Error());

    await controller.getCustomerData();

    expect(controller.loading.value, false);
    expect(controller.error.value, true);
    expect(controller.customer.value, null);
  });
}
