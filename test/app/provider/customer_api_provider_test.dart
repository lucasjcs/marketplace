import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql/client.dart';
import 'package:marketplace_nuconta/app/provider/customer_api_provider.dart';
import 'package:mockito/mockito.dart';

import '../../mock/customer_data_mock.dart';
import '../../mock/generated/generated_mocks.mocks.dart';

void main() {
  GraphQLClient client = MockGraphQLClient();

  QueryOptions options = MockQueryOptions();
  CustomerApiProvider provider = CustomerApiProvider(graphQLClient: client);

  test('should return customer data correctly', () async {
    when(client.query(options)).thenAnswer(
      (_) async => QueryResult(
        source: any,
        data: jsonDecode(
          CustomerDataMock.customerData,
        ),
      ),
    );

    /**
     * TODO: finish provider tests
     */
  });
}
