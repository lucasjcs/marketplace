import 'package:graphql/client.dart';

import '../domain/entity/entity.dart';
import '../domain/gateways/gateways.dart';
import '../domain/model/model.dart';

import 'graphql/client/client_graphql.dart';
import 'graphql/queries/graphql_queries.dart';

class MakePurchaseProvider implements MakePurchaseGateway {
  final ClientGraphQL graphQLClient;

  MakePurchaseProvider({required this.graphQLClient});

  @override
  Future<PurchaseResponse?> makePurchase({required String offerId}) async {
    final options = MutationOptions(
      document: GraphQLQueries.purchase(offerId),
    );

    final response = await graphQLClient.mutate(options: options);

    if (!response.hasException && response.data != null) {
      return PurchaseResponseModel.fromJson(response.data!['purchase']);
    }

    return null;
  }
}
