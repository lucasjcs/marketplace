import 'package:marketplace_nuconta/app/domain/gateways/gateways.dart';
import 'package:marketplace_nuconta/app/domain/usecase/make_purshase_usecase.dart';
import 'package:marketplace_nuconta/app/provider/customer_api_provider.dart';

import '../ui/pages/marketplace/marketplace_controller.dart';

class MarketplaceControllerFactory {
  static MarketplaceController create({required dynamic graphQLClient}) =>
      MarketplaceController(
        makePurshaseUseCase: MakePurshaseUseCase(
          makePurshaseGateway:
              CustomerApiProvider(graphQLClient: graphQLClient),
        ),
      );
}
