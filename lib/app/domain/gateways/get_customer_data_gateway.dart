import '../../domain/entity/entity.dart';

abstract class GetCustomerDataGateway {
  Future<Customer?> getCustomerData();
}
