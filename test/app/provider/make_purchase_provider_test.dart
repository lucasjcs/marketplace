import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:marketplace_nuconta/app/domain/entity/entity.dart';
import 'package:marketplace_nuconta/app/provider/graphql/client/client_graphql.dart';
import 'package:marketplace_nuconta/app/provider/graphql/queries/graphql_queries.dart';
import 'package:marketplace_nuconta/app/provider/provider.dart';
import 'package:mockito/mockito.dart';

import '../../mock/generated/generated_mocks.mocks.dart';
import '../../mock/graphql_customer_response_mock.dart';
import '../../mock/purchase_data_mock.dart';

void main() {
  late MakePurchaseProvider provider;
  late ClientGraphQL client;

  setUp(() {
    client = MockClientGraphQL();
    provider = MakePurchaseProvider(graphQLClient: client);
  });

  test('should make a purchase with success', () async {
    final data = GraphQLCustomerResponseMock(
      data: jsonDecode(PurchaseDataMock.withSuccess)['data'],
      hasException: false,
    );

    when(client.mutate(
      query: GraphQLQueries.purchase('product/portal-gun'),
    )).thenAnswer((_) async => data);

    final response = await provider.makePurchase(offerId: 'product/portal-gun');

    expect(response is PurchaseResponse, true);
    expect(response == null, false);
  });

  test('should return null when throw a exception', () async {
    final data = GraphQLCustomerResponseMock(
      data: jsonDecode(PurchaseDataMock.withSuccess)['data'],
      hasException: true,
    );

    when(client.mutate(
      query: GraphQLQueries.purchase('product/portal-gun'),
    )).thenAnswer((_) async => data);

    final response = await provider.makePurchase(offerId: 'product/portal-gun');

    expect(response is PurchaseResponse, false);
    expect(response == null, true);
  });
}
