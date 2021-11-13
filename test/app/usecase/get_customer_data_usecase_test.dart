import 'dart:convert';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:marketplace_nuconta/app/domain/gateways/gateways.dart';
import 'package:marketplace_nuconta/app/domain/model/model.dart';
import 'package:marketplace_nuconta/app/domain/usecase/get_customer_data_usecase.dart';

import '../../mock/customer_data_mock.dart';
import '../../mock/generated/generated_mocks.dart';

void main() {
  late GetCustomerDataGateway getCustomerDataGatewayMock;
  late GetCustomerDataUseCase getCustomerDataUseCase;

  setUp(() {
    getCustomerDataGatewayMock = MockGetCustomerDataGateway();
    getCustomerDataUseCase = GetCustomerDataUseCase(
      getCustomerDataGateway: getCustomerDataGatewayMock,
    );
  });

  test('should return customer data correctly', () async {
    final data = jsonDecode(
      CustomerDataMock.customerData,
    )['data']['viewer'];

    when(getCustomerDataGatewayMock.getCustomerData()).thenAnswer(
      (_) async => CustomerModel.fromJson(data),
    );

    final response = await getCustomerDataUseCase.execute();

    expect(response is CustomerModel, true);
    expect(response == null, false);
    expect(response!.name, 'Jerry Smith');
    expect(response.id, 'cccc3f48-dd2c-43ba-b8de-8945e7ababab');
    expect(response.balance, 1000000);
  });
}
