import '../../domain/entity/entity.dart';
import '../../domain/gateways/gateways.dart';
import '../../domain/interactor/interactor.dart';

class GetCustomerDataUseCase implements GetCustomerDataInteractor {
  final GetCustomerDataGateway getCustomerDataGateway;

  GetCustomerDataUseCase({
    required this.getCustomerDataGateway,
  });

  @override
  Future<Customer?> execute() async {
    final response = await this.getCustomerDataGateway.getCustomerData();
    return response;
  }
}
