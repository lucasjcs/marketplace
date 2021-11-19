import 'dart:convert';

import 'package:marketplace_nuconta/app/domain/entity/entity.dart';
import 'package:marketplace_nuconta/app/domain/model/customer_model.dart';
import 'package:marketplace_nuconta/app/domain/model/purchase_response_model.dart';

import '../../mock/customer_data_mock.dart';

class TestUtils {
  static CustomerModel makeCustomerData() {
    final data = jsonDecode(
      CustomerDataMock.customerData,
    )['viewer'];

    return CustomerModel.fromJson(data);
  }

  static Future<PurchaseResponse> makePurshaseResponse(String dataMock) async {
    final data = jsonDecode(dataMock)['data']['purchase'];
    return PurchaseResponseModel.fromJson(data);
  }
}
