import '../domain/usecase/get_customer_data_usecase.dart';
import '../provider/customer_api_provider.dart';
import '../ui/pages/app_controller.dart';

class AppControllerFactory {
  static AppController create({required dynamic graphQLClient}) =>
      AppController(
        getCustomerDataUseCase: GetCustomerDataUseCase(
          getCustomerDataGateway:
              CustomerApiProvider(graphQLClient: graphQLClient),
        ),
      );
}
