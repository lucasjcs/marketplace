import 'package:get/get.dart';

import '../provider/graphql/client/client_graphql.dart';
import '../ui/constants/constants.dart';
import '../domain/usecase/usecase.dart';
import '../provider/provider.dart';
import '../ui/pages/app_controller.dart';
import '../ui/pages/marketplace/marketplace_controller.dart';

class GetControllerFactory {
  static void create(ClientGraphQL client) {
    Get.put(
      AppController(
        getCustomerDataUseCase: GetCustomerDataUseCase(
          getCustomerDataGateway: CustomerApiProvider(graphQLClient: client),
        ),
      ),
      tag: Tags.appController,
    );

    Get.put(
      MarketplaceController(
        makePurchaseUseCase: MakePurchaseUseCase(
          makePurchaseGateway: MakePurchaseProvider(graphQLClient: client),
        ),
      ),
      tag: Tags.marketplaceController,
    );
  }
}
