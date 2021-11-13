import 'package:get/get.dart';
import 'package:marketplace_nuconta/app/factory/app_controller_factory.dart';
import 'package:marketplace_nuconta/app/provider/graphql/client/graphql_client.dart';
import 'package:marketplace_nuconta/app/routes/app_routes.dart';
import '../ui/pages/pages.dart';

class GetRoutes {
  List<GetPage<dynamic>> get routes {
    final graphQLClient = GraphQLClient();

    final appController = AppControllerFactory.create(
      graphqlRequest: graphQLClient.api(),
    );

    return [
      GetPage(
        name: AppRoutes.homePage,
        page: () => HomePage(controller: appController),
      ),
    ];
  }
}
