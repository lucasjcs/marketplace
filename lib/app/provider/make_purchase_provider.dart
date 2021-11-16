import 'package:graphql/client.dart';
import 'package:marketplace_nuconta/app/domain/entity/entity.dart';
import 'package:marketplace_nuconta/app/domain/gateways/make_purchase_gateway.dart';
import 'package:marketplace_nuconta/app/domain/model/purchase_response_model.dart';

class MakePurchaseProvider implements MakePurchaseGateway {
  final GraphQLClient graphQLClient;

  MakePurchaseProvider({required this.graphQLClient});

  @override
  Future<PurchaseResponse?> makePurchase({required String offerId}) async {
    final options = MutationOptions(
      document: gql(
        '''mutation {
            purchase (offerId: \"$offerId\") {
                success
                errorMessage
                customer {
                    id
                    name
                    balance
                }
              }
            }
        ''',
      ),
    );

    final response = await graphQLClient.mutate(options);

    if (!response.hasException && response.data != null) {
      return PurchaseResponseModel.fromJson(response.data!['purchase']);
    }

    return null;
  }
}
