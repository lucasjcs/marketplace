import 'package:graphql/client.dart';
import 'package:marketplace_nuconta/app/domain/entity/entity.dart';

import '../domain/model/model.dart';

import '../domain/gateways/gateways.dart';

class CustomerApiProvider implements GetCustomerDataGateway {
  final GraphQLClient graphQLClient;

  CustomerApiProvider({required this.graphQLClient});

  @override
  Future<Customer?> getCustomerData() async {
    final QueryOptions options = QueryOptions(document: gql(r''' 
        query {
          viewer {
            id
            name
            balance
            offers {
              id
              price
              product {
                id
                name
                description
                image
              }
            }
          }
        }
      '''));

    final result = await graphQLClient.query(options);

    if (!result.hasException && result.data != null) {
      return CustomerModel.fromJson(result.data!['viewer']);
    }

    return null;
  }
}
