import 'package:marketplace_nuconta/app/domain/gateways/gateways.dart';
import 'package:marketplace_nuconta/app/domain/usecase/make_purshase_usecase.dart';
import 'package:marketplace_nuconta/app/provider/make_purchase_provider.dart';

import '../ui/pages/marketplace/marketplace_controller.dart';

class MarketplaceControllerFactory {
  static MarketplaceController create({
    required dynamic graphQLClient,
    required appController,
  }) =>
      MarketplaceController(
        appController: appController,
        makePurchaseUseCase: MakePurchaseUseCase(
          makePurchaseGateway:
              MakePurchaseProvider(graphQLClient: graphQLClient),
        ),
      );
}
