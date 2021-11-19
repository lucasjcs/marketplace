import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql/client.dart';

import '../../../domain/gateways/gateways.dart';

class ClientGraphQL implements GraphqlMutateGateway, GraphqlQueryGateway {
  late GraphQLClient _client;

  ClientGraphQL() {
    final _baseUrl = dotenv.env['BASE_URL'];
    final _accessToken = dotenv.env['ACCESS_TOKEN'];

    final Link _link = HttpLink(
      '$_baseUrl',
      defaultHeaders: {
        'Authorization': 'Bearer $_accessToken',
      },
    );

    this._client = GraphQLClient(
      cache: GraphQLCache(),
      link: _link,
    );
  }

  @override
  Future mutate({required String query}) async => await _client.mutate(
        MutationOptions(document: gql(query)),
      );

  @override
  Future query({required String query}) async => await _client.query(
        QueryOptions(document: gql(query)),
      );
}
