import 'package:graphql/client.dart';

abstract class GraphqlQueryGateway {
  Future<dynamic> query({required QueryOptions options});
}
