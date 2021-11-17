import 'package:graphql/client.dart';
import 'package:marketplace_nuconta/app/domain/entity/entity.dart';
import 'package:marketplace_nuconta/app/provider/graphql/queries/graphql_queries.dart';

import '../domain/model/model.dart';

import '../domain/gateways/gateways.dart';
import 'graphql/client/client_graphql.dart';

class CustomerApiProvider implements GetCustomerDataGateway {
  final ClientGraphQL graphQLClient;

  CustomerApiProvider({required this.graphQLClient});

  @override
  Future<Customer?> getCustomerData() async {
    final QueryOptions options = QueryOptions(
      document: GraphQLQueries.getCustomerData,
    );

    final result = await graphQLClient.query(options: options);

    if (!result.hasException && result.data != null) {
      return CustomerModel.fromJson(result.data!['viewer']);
    }

    return null;
  }
}
