// Mocks generated by Mockito 5.0.16 from annotations
// in marketplace_nuconta/test/mock/generated/generated_mocks.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:marketplace_nuconta/app/domain/entity/entity.dart' as _i6;
import 'package:marketplace_nuconta/app/domain/gateways/gateways.dart' as _i3;
import 'package:marketplace_nuconta/app/domain/model/model.dart' as _i2;
import 'package:marketplace_nuconta/app/domain/usecase/get_customer_data_usecase.dart'
    as _i5;
import 'package:marketplace_nuconta/app/provider/graphql/client/graphql_client.dart'
    as _i7;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeCustomerModel_0 extends _i1.Fake implements _i2.CustomerModel {}

class _FakeGetCustomerDataGateway_1 extends _i1.Fake
    implements _i3.GetCustomerDataGateway {}

/// A class which mocks [GetCustomerDataGateway].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetCustomerDataGateway extends _i1.Mock
    implements _i3.GetCustomerDataGateway {
  MockGetCustomerDataGateway() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.CustomerModel> getCustomerData() => (super.noSuchMethod(
          Invocation.method(#getCustomerData, []),
          returnValue: Future<_i2.CustomerModel>.value(_FakeCustomerModel_0()))
      as _i4.Future<_i2.CustomerModel>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [GetCustomerDataUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetCustomerDataUseCase extends _i1.Mock
    implements _i5.GetCustomerDataUseCase {
  MockGetCustomerDataUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.GetCustomerDataGateway get getCustomerDataGateway =>
      (super.noSuchMethod(Invocation.getter(#getCustomerDataGateway),
              returnValue: _FakeGetCustomerDataGateway_1())
          as _i3.GetCustomerDataGateway);
  @override
  _i4.Future<_i6.Customer?> execute() => (super.noSuchMethod(
      Invocation.method(#execute, []),
      returnValue: Future<_i6.Customer?>.value()) as _i4.Future<_i6.Customer?>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [GraphQLClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockGraphQLClient extends _i1.Mock implements _i7.GraphQLClient {
  MockGraphQLClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String toString() => super.toString();
}
