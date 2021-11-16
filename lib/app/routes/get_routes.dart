import 'package:get/get.dart';
import 'package:marketplace_nuconta/app/factory/marketplace_controller_factory.dart';
import 'package:marketplace_nuconta/app/ui/pages/marketplace/marketplace_page.dart';
import 'package:marketplace_nuconta/app/ui/pages/marketplace/marketplace_details_page.dart';

import '../factory/app_controller_factory.dart';
import '../provider/graphql/client/graphql_client.dart';
import '../routes/app_routes.dart';
import '../ui/pages/pages.dart';

class GetRoutes {
  List<GetPage<dynamic>> get routes {
    final api = GraphqlClient.api();
    final appController = AppControllerFactory.create(
      graphQLClient: api,
    );

    final marketplaceController = MarketplaceControllerFactory.create(
      appController: appController,
      graphQLClient: api,
    );

    return [
      GetPage(
        name: AppRoutes.splash,
        page: () => SplashPage(controller: appController),
      ),
      GetPage(
        name: AppRoutes.homePage,
        page: () => HomePage(controller: appController),
      ),
      GetPage(
        name: AppRoutes.marketplace,
        page: () => MarketplacePage(
          controller: marketplaceController,
        ),
      ),
    ];
  }
}
