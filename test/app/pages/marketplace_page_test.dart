import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import 'package:marketplace_nuconta/app/ui/components/rounded_button.dart';
import 'package:marketplace_nuconta/app/ui/pages/app_controller.dart';
import 'package:marketplace_nuconta/app/ui/pages/marketplace/components/offer_item.dart';
import 'package:marketplace_nuconta/app/ui/pages/marketplace/marketplace_controller.dart';
import 'package:marketplace_nuconta/app/ui/pages/marketplace/marketplace_page.dart';

import 'package:network_image_mock/network_image_mock.dart';

import '../../mock/generated/generated_mocks.dart';
import '../test_utils/test_utils.dart';
import 'nu_app_mock.dart';

void main() {
  late AppController appController;

  setUp(() {
    appController = AppController(
      getCustomerDataUseCase: MockGetCustomerDataUseCase(),
    );

    Get.put(
      appController,
      tag: 'app_controller',
    );

    Get.put(
      MarketplaceController(
        makePurchaseUseCase: MockMakePurchaseUseCase(),
      ),
      tag: 'marketplace_controller',
    );
  });

  renderApp(WidgetTester tester) async {
    await tester.pumpWidget(
      NuAppMock(
        widget: MarketplacePage(),
      ),
    );

    await tester.pumpAndSettle();
  }

  testWidgets('should render the marketplace page',
      (WidgetTester tester) async {
    appController.customer = await TestUtils.makeCustomerData();

    await mockNetworkImagesFor(() async {
      await renderApp(tester);

      expect(find.text('Marketplace'), findsOneWidget);
      expect(
        find.text('Enjoy the legendary items we\'ve separated for you'),
        findsOneWidget,
      );
      expect(find.byType(OfferItem), findsNWidgets(4));
    });
  });

  /**
   * Integration
   */
  testWidgets('should navigate to details', (WidgetTester tester) async {
    appController.customer = await TestUtils.makeCustomerData();

    await mockNetworkImagesFor(() async {
      await renderApp(tester);

      await tester.tap(find.text('See more').first);
      await tester.pumpAndSettle();

      expect(find.text('Portal Gun'), findsNWidgets(2));
      expect(find.text('Description'), findsOneWidget);
      expect(find.byType(RoundedButton), findsOneWidget);
      expect(find.text('Buy'), findsOneWidget);
    });
  });
}
