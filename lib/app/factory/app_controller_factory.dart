import 'package:marketplace_nuconta/app/domain/usecase/get_customer_data_usecase.dart';
import 'package:marketplace_nuconta/app/provider/graphql/customer_api_provider.dart';
import 'package:marketplace_nuconta/app/ui/pages/app_controller.dart';

class AppControllerFactory {
  static AppController create({required dynamic graphqlRequest}) =>
      AppController(
        getCustomerDataUseCase: GetCustomerDataUseCase(
          getCustomerDataGateway:
              CustomerApiProvider(graphqlRequest: graphqlRequest),
        ),
      );
}
