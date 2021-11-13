import 'package:marketplace_nuconta/app/domain/model/customer_model.dart';

import '../../domain/gateways/gateways.dart';

class CustomerApiProvider implements GetCustomerDataGateway {
  final dynamic graphqlRequest;

  CustomerApiProvider({this.graphqlRequest});

  @override
  Future<CustomerModel> getCustomerData() async {
    //TODO: make a correct api request
    final response = graphqlRequest.get('/customer');

    return response;
  }
}
