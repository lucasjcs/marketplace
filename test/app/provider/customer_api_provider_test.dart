import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:marketplace_nuconta/app/domain/entity/entity.dart';
import 'package:marketplace_nuconta/app/provider/customer_api_provider.dart';
import 'package:marketplace_nuconta/app/provider/graphql/client/client_graphql.dart';
import 'package:marketplace_nuconta/app/provider/graphql/queries/graphql_queries.dart';
import 'package:mockito/mockito.dart';

import '../../mock/customer_data_mock.dart';
import '../../mock/generated/generated_mocks.mocks.dart';
import '../../mock/graphql_customer_response_mock.dart';

void main() {
  late CustomerApiProvider provider;
  late ClientGraphQL client;

  setUp(() {
    client = MockClientGraphQL();
    provider = CustomerApiProvider(graphQLClient: client);
  });

  test('should return customer data correctly', () async {
    final data = GraphQLCustomerResponseMock(
      data: jsonDecode(CustomerDataMock.customerData),
      hasException: false,
    );

    when(client.query(query: GraphQLQueries.getCustomerData)).thenAnswer(
      (_) async => data,
    );

    final response = await provider.getCustomerData();

    expect(response is Customer, true);
    expect(response == null, false);
  });

  test('should return null data when throw a exception', () async {
    final data = GraphQLCustomerResponseMock(
      data: jsonDecode(CustomerDataMock.customerData),
      hasException: true,
    );

    when(client.query(query: GraphQLQueries.getCustomerData)).thenAnswer(
      (_) async => data,
    );

    final response = await provider.getCustomerData();

    expect(response is Customer, false);
    expect(response == null, true);
  });
}
