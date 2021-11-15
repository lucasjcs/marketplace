import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:marketplace_nuconta/app/factory/factory.dart';
import 'package:marketplace_nuconta/app/routes/app_routes.dart';
import 'package:marketplace_nuconta/app/ui/components/rounded_button.dart';
import 'package:marketplace_nuconta/app/ui/pages/app_controller.dart';
import 'package:marketplace_nuconta/app/ui/pages/home/home_page.dart';
import 'package:marketplace_nuconta/app/ui/pages/marketplace/marketplace_page.dart';
import 'package:marketplace_nuconta/app/ui/util/util.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../mock/generated/generated_mocks.mocks.dart';
import '../test_utils/test_utils.dart';
import 'nu_app_mock.dart';

void main() {
  late GraphQLClient client;
  late AppController appController;

  setUp(() {
    client = MockGraphQLClient();
    appController = AppControllerFactory.create(
      graphQLClient: client,
    );
  });

  routes() => [
        GetPage(
          name: AppRoutes.marketplace,
          page: () => Marketplace(controller: appController),
        ),
      ];

  renderApp(WidgetTester tester) async {
    await tester.pumpWidget(
      NuAppMock(
        routes: routes(),
        widget: HomePage(
          controller: appController,
        ),
      ),
    );

    await tester.pumpAndSettle();
  }

  testWidgets('should render the home page', (WidgetTester tester) async {
    appController.customer.value = await TestUtils.makeCustomerData();

    await renderApp(tester);

    expect(find.text('Hello, Jerry Smith'), findsOneWidget);
    expect(find.text('Balance'), findsOneWidget);
    expect(
        find.text('\$ ${Util.toMoney(appController.customer.value!.balance!)}'),
        findsOneWidget);
    expect(find.text('Nu Marketplace'), findsOneWidget);
  });

  testWidgets('should navigate to marketplace ', (WidgetTester tester) async {
    appController.customer.value = await TestUtils.makeCustomerData();

    await renderApp(tester);
    await mockNetworkImagesFor(() async {
      await tester.tap(find.byType(RoundedButton));
      await tester.pumpAndSettle();
    });

    expect(find.text('Marketplace'), findsOneWidget);
    expect(find.text('Today\'s picks'), findsOneWidget);
  });
}
