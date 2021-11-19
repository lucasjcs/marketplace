import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import 'package:marketplace_nuconta/app/domain/usecase/usecase.dart';

import 'package:marketplace_nuconta/app/ui/components/rounded_button.dart';
import 'package:marketplace_nuconta/app/ui/pages/app_controller.dart';
import 'package:marketplace_nuconta/app/ui/pages/home/home_page.dart';

import 'package:marketplace_nuconta/app/ui/pages/marketplace/marketplace_controller.dart';
import 'package:marketplace_nuconta/app/ui/pages/marketplace/marketplace_details_page.dart';
import 'package:marketplace_nuconta/app/ui/pages/marketplace/purchase_completed_page.dart';
import 'package:mockito/mockito.dart';

import 'package:network_image_mock/network_image_mock.dart';

import '../../mock/generated/generated_mocks.dart';
import '../../mock/purchase_data_mock.dart';
import '../test_utils/test_utils.dart';
import 'nu_app_mock.dart';

void main() {
  late AppController appController;
  late MakePurchaseUseCase makePurchaseUseCase = MockMakePurchaseUseCase();

  setUp(() {
    appController = AppController(
      getCustomerDataUseCase: MockGetCustomerDataUseCase(),
    );
    appController.customer = TestUtils.makeCustomerData();
    Get.put(
      appController,
      tag: 'app_controller',
    );

    Get.put(
      MarketplaceController(
        makePurchaseUseCase: makePurchaseUseCase,
      ),
      tag: 'marketplace_controller',
    );
  });

  renderApp(WidgetTester tester) async {
    await tester.pumpWidget(
      NuAppMock(
        widget: MarketPlaceDetails(
          offer: appController.customer.offers!.first,
        ),
      ),
    );

    await tester.pumpAndSettle();
  }

  testWidgets('should render product details', (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      await renderApp(tester);

      expect(find.text('Portal Gun'), findsNWidgets(2));
      expect(find.text('\$ 5.000'), findsOneWidget);
      expect(find.byType(RoundedButton), findsOneWidget);
      expect(find.text('Buy'), findsOneWidget);
    });
  });

  /**
   * Integrations tests
   */
  testWidgets('should show a confirmation dialog', (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      await renderApp(tester);

      await tester.tap(find.text('Buy'));
      await tester.pumpAndSettle();

      expect(
        find.text('Do you want to complete the purchase?'),
        findsOneWidget,
      );
      expect(
        find.text('You are buying a Portal Gun, want to continue?'),
        findsOneWidget,
      );
      expect(find.text('Buy now'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
    });
  });

  testWidgets('should complete a purchase and back to home', (
    WidgetTester tester,
  ) async {
    when(makePurchaseUseCase.execute(offerId: 'offer/portal-gun')).thenAnswer(
      (_) async => TestUtils.makePurshaseResponse(PurchaseDataMock.withSuccess),
    );
    await mockNetworkImagesFor(() async {
      await renderApp(tester);

      await tester.tap(find.text('Buy'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Buy now'));
      await tester.pumpAndSettle();

      expect(find.byType(PurchaseCompletedPage), findsOneWidget);
      expect(find.text('Your purchase was successful!'), findsOneWidget);
      expect(find.text('Close'), findsOneWidget);

      await tester.tap(find.text('Close'));
      await tester.pumpAndSettle();

      expect(find.byType(HomePage), findsOneWidget);
    });
  });

  testWidgets('should not complete purchase on error', (
    WidgetTester tester,
  ) async {
    await mockNetworkImagesFor(() async {
      when(makePurchaseUseCase.execute(offerId: 'offer/portal-gun')).thenAnswer(
        (_) async => TestUtils.makePurshaseResponse(PurchaseDataMock.expired),
      );
      await renderApp(tester);

      await tester.tap(find.text('Buy'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Buy now'));
      await tester.pumpAndSettle();

      expect(find.byType(PurchaseCompletedPage), findsNothing);

      expect(
        find.text('Do you want to complete the purchase?'),
        findsNothing,
      );
      expect(
        find.text('You are buying a Portal Gun, want to continue?'),
        findsNothing,
      );
      expect(find.text('Buy now'), findsNothing);
      expect(find.text('Cancel'), findsNothing);
    });
  });
}
