import 'package:marketplace_nuconta/app/core/domain/customer.dart';
import 'package:marketplace_nuconta/app/core/gateways/gateways.dart';

import '../../core/interactor/interactor.dart';

class GetCustomerDataUseCase implements GetCustomerDataInteractor {
  final GetCustomerDataGateway getCustomerDataGateway;

  GetCustomerDataUseCase({
    required this.getCustomerDataGateway,
  });

  @override
  Future<Customer?> execute() {
    // TODO: implement execute
    throw UnimplementedError();
  }
}
