import 'package:graphql/client.dart';

class GraphqlClient {
  static GraphQLClient api() {
    final Link _link = HttpLink(
      'https://staging-nu-needful-things.nubank.com.br/query',
      defaultHeaders: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhd2Vzb21lY3VzdG9tZXJAZ21haWwuY29tIn0.cGT2KqtmT8KNIJhyww3T8fAzUsCD5_vxuHl5WbXtp8c',
      },
    );

    return GraphQLClient(
      cache: GraphQLCache(),
      link: _link,
    );
  }
}
