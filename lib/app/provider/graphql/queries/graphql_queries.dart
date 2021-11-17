import 'package:graphql/client.dart';

abstract class GraphQLQueries {
  static purchase(offerId) => gql(
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
      );

  static final getCustomerData = gql(r''' 
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
     ''');
}
