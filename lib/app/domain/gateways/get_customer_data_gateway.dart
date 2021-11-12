import '../../domain/model/model.dart';

abstract class GetCustomerDataGateway {
  Future<CustomerModel> getCustomerOffers();
}
