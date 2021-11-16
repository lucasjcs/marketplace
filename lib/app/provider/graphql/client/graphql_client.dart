import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql/client.dart';

class GraphqlClient {
  static GraphQLClient api() {
    final _baseUrl = dotenv.env['BASE_URL'];
    final _accessToken = dotenv.env['ACCESS_TOKEN'];

    final Link _link = HttpLink(
      '$_baseUrl',
      defaultHeaders: {
        'Authorization': 'Bearer $_accessToken',
      },
    );

    return GraphQLClient(
      cache: GraphQLCache(),
      link: _link,
    );
  }
}
