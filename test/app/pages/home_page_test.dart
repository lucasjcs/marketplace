import 'package:flutter_test/flutter_test.dart';
import 'package:marketplace_nuconta/app/factory/factory.dart';
import 'package:marketplace_nuconta/app/provider/graphql/client/graphql_client.dart';
import 'package:marketplace_nuconta/app/ui/pages/app_controller.dart';
import 'package:marketplace_nuconta/app/ui/pages/home/home_page.dart';

import '../../mock/generated/generated_mocks.mocks.dart';
import 'nu_app_mock.dart';

void main() {
  late GraphQLClient client;
  late AppController appController;

  setUp(() {
    client = MockGraphQLClient();
    appController = AppControllerFactory.create(
      graphqlRequest: client,
    );
  });

  renderApp(WidgetTester tester) async {
    await tester.pumpWidget(
      NuAppMock(
        widget: HomePage(
          controller: appController,
        ),
      ),
    );

    await tester.pumpAndSettle();
  }

  testWidgets('should render the home page correctly',
      (WidgetTester tester) async {
    await renderApp(tester);

    expect(find.text('im happy'), findsOneWidget);
  });
}
