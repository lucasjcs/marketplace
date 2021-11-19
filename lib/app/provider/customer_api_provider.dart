import '../domain/entity/entity.dart';

import '../domain/model/model.dart';
import '../domain/gateways/gateways.dart';

import 'graphql/client/client_graphql.dart';
import 'graphql/queries/graphql_queries.dart';

class CustomerApiProvider implements GetCustomerDataGateway {
  final ClientGraphQL graphQLClient;

  CustomerApiProvider({required this.graphQLClient});

  @override
  Future<Customer?> getCustomerData() async {
    final response = await graphQLClient.query(
      query: GraphQLQueries.getCustomerData,
    );
    if (!response.hasException && response.data != null) {
      return CustomerModel.fromJson(response.data!['viewer']);
    }

    return null;
  }
}
