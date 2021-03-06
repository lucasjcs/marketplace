import 'package:marketplace_nuconta/app/domain/gateways/gateways.dart';
import 'package:marketplace_nuconta/app/domain/usecase/make_purshase_usecase.dart';
import 'package:marketplace_nuconta/app/domain/usecase/usecase.dart';
import 'package:marketplace_nuconta/app/provider/graphql/client/client_graphql.dart';
import 'package:marketplace_nuconta/app/ui/pages/app_controller.dart';
import 'package:mockito/annotations.dart';

export 'generated_mocks.mocks.dart';

/**this file is used only to generate all mocks in a single place*/
@GenerateMocks([
  GetCustomerDataGateway,
  GetCustomerDataUseCase,
  MakePurchaseGateway,
  MakePurchaseUseCase,
  AppController,
  ClientGraphQL
])
void fn() {}
