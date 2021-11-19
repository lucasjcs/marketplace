abstract class GraphQLQueries {
  static purchase(offerId) => '''mutation {
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
        ''';

  static final getCustomerData = r''' 
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
     ''';
}
