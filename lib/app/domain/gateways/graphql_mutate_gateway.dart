import 'package:graphql/client.dart';

abstract class GraphqlMutateGateway {
  Future mutate({required MutationOptions options});
}
