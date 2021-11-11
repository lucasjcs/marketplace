import '../../core/domain/domain.dart';

abstract class GetCustomerDataInteractor {
  Future<Customer?> execute();
}
