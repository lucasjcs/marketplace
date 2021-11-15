import 'dart:convert';

import 'package:marketplace_nuconta/app/domain/model/customer_model.dart';

import '../../mock/customer_data_mock.dart';

class TestUtils {
  static Future<CustomerModel> makeCustomerData() async {
    final data = jsonDecode(
      CustomerDataMock.customerData,
    )['data']['viewer'];

    return CustomerModel.fromJson(data);
  }
}
