import 'dart:convert';

import 'package:marketplace_nuconta/app/domain/model/customer_model.dart';
import 'package:marketplace_nuconta/app/provider/graphql/client/graphql_client.dart';

import '../../domain/gateways/gateways.dart';
import 'customer_data_mock.dart';

class CustomerApiProvider implements GetCustomerDataGateway {
  final dynamic graphqlRequest;

  CustomerApiProvider({this.graphqlRequest});

  @override
  Future<CustomerModel> getCustomerData() async {
    final data = jsonDecode(
      CustomerDataMock.customerData,
    )['data']['viewer'];

    final response = CustomerModel.fromJson(data);

    return response;
  }
}
