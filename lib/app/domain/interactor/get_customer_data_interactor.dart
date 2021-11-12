import '../../domain/entity/entity.dart';

abstract class GetCustomerDataInteractor {
  Future<Customer?> execute();
}
