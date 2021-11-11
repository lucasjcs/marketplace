import '../../core/model/model.dart';

abstract class GetCustomerDataGateway {
  Future<CustomerModel> getCustomerOffers();
}
