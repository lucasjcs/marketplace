// Mocks generated by Mockito 5.0.16 from annotations
// in marketplace_nuconta/test/mock/generated/generated_mocks.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;
import 'dart:ui' as _i10;

import 'package:get/get.dart' as _i5;
import 'package:get/get_state_manager/src/simple/list_notifier.dart' as _i9;
import 'package:marketplace_nuconta/app/domain/entity/entity.dart' as _i4;
import 'package:marketplace_nuconta/app/domain/gateways/gateways.dart' as _i2;
import 'package:marketplace_nuconta/app/domain/usecase/get_customer_data_usecase.dart'
    as _i3;
import 'package:marketplace_nuconta/app/domain/usecase/make_purshase_usecase.dart'
    as _i7;
import 'package:marketplace_nuconta/app/provider/graphql/client/client_graphql.dart'
    as _i12;
import 'package:marketplace_nuconta/app/ui/mixins/page_state.dart' as _i11;
import 'package:marketplace_nuconta/app/ui/pages/app_controller.dart' as _i8;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeGetCustomerDataGateway_0 extends _i1.Fake
    implements _i2.GetCustomerDataGateway {}

class _FakeMakePurchaseGateway_1 extends _i1.Fake
    implements _i2.MakePurchaseGateway {}

class _FakeGetCustomerDataUseCase_2 extends _i1.Fake
    implements _i3.GetCustomerDataUseCase {}

class _FakeCustomer_3 extends _i1.Fake implements _i4.Customer {}

class _FakeInternalFinalCallback_4<T> extends _i1.Fake
    implements _i5.InternalFinalCallback<T> {}

class _FakeRxBool_5 extends _i1.Fake implements _i5.RxBool {}

class _FakeRxString_6 extends _i1.Fake implements _i5.RxString {}

/// A class which mocks [GetCustomerDataGateway].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetCustomerDataGateway extends _i1.Mock
    implements _i2.GetCustomerDataGateway {
  MockGetCustomerDataGateway() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i4.Customer?> getCustomerData() => (super.noSuchMethod(
      Invocation.method(#getCustomerData, []),
      returnValue: Future<_i4.Customer?>.value()) as _i6.Future<_i4.Customer?>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [GetCustomerDataUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetCustomerDataUseCase extends _i1.Mock
    implements _i3.GetCustomerDataUseCase {
  MockGetCustomerDataUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetCustomerDataGateway get getCustomerDataGateway =>
      (super.noSuchMethod(Invocation.getter(#getCustomerDataGateway),
              returnValue: _FakeGetCustomerDataGateway_0())
          as _i2.GetCustomerDataGateway);
  @override
  _i6.Future<_i4.Customer?> execute() => (super.noSuchMethod(
      Invocation.method(#execute, []),
      returnValue: Future<_i4.Customer?>.value()) as _i6.Future<_i4.Customer?>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [MakePurchaseGateway].
///
/// See the documentation for Mockito's code generation for more information.
class MockMakePurchaseGateway extends _i1.Mock
    implements _i2.MakePurchaseGateway {
  MockMakePurchaseGateway() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i4.PurchaseResponse?> makePurchase({String? offerId}) =>
      (super.noSuchMethod(
              Invocation.method(#makePurchase, [], {#offerId: offerId}),
              returnValue: Future<_i4.PurchaseResponse?>.value())
          as _i6.Future<_i4.PurchaseResponse?>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [MakePurchaseUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockMakePurchaseUseCase extends _i1.Mock
    implements _i7.MakePurchaseUseCase {
  MockMakePurchaseUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.MakePurchaseGateway get makePurchaseGateway => (super.noSuchMethod(
      Invocation.getter(#makePurchaseGateway),
      returnValue: _FakeMakePurchaseGateway_1()) as _i2.MakePurchaseGateway);
  @override
  _i6.Future<_i4.PurchaseResponse?> execute({String? offerId}) =>
      (super.noSuchMethod(Invocation.method(#execute, [], {#offerId: offerId}),
              returnValue: Future<_i4.PurchaseResponse?>.value())
          as _i6.Future<_i4.PurchaseResponse?>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [AppController].
///
/// See the documentation for Mockito's code generation for more information.
class MockAppController extends _i1.Mock implements _i8.AppController {
  MockAppController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.GetCustomerDataUseCase get getCustomerDataUseCase =>
      (super.noSuchMethod(Invocation.getter(#getCustomerDataUseCase),
              returnValue: _FakeGetCustomerDataUseCase_2())
          as _i3.GetCustomerDataUseCase);
  @override
  _i4.Customer get customer => (super.noSuchMethod(Invocation.getter(#customer),
      returnValue: _FakeCustomer_3()) as _i4.Customer);
  @override
  set customer(_i4.Customer? value) =>
      super.noSuchMethod(Invocation.setter(#customer, value),
          returnValueForMissingStub: null);
  @override
  _i5.InternalFinalCallback<void> get onStart =>
      (super.noSuchMethod(Invocation.getter(#onStart),
              returnValue: _FakeInternalFinalCallback_4<void>())
          as _i5.InternalFinalCallback<void>);
  @override
  _i5.InternalFinalCallback<void> get onDelete =>
      (super.noSuchMethod(Invocation.getter(#onDelete),
              returnValue: _FakeInternalFinalCallback_4<void>())
          as _i5.InternalFinalCallback<void>);
  @override
  bool get initialized =>
      (super.noSuchMethod(Invocation.getter(#initialized), returnValue: false)
          as bool);
  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  int get listeners =>
      (super.noSuchMethod(Invocation.getter(#listeners), returnValue: 0)
          as int);
  @override
  _i5.RxBool get loading => (super.noSuchMethod(Invocation.getter(#loading),
      returnValue: _FakeRxBool_5()) as _i5.RxBool);
  @override
  set loading(_i5.RxBool? _loading) =>
      super.noSuchMethod(Invocation.setter(#loading, _loading),
          returnValueForMissingStub: null);
  @override
  _i5.RxBool get error => (super.noSuchMethod(Invocation.getter(#error),
      returnValue: _FakeRxBool_5()) as _i5.RxBool);
  @override
  set error(_i5.RxBool? _error) =>
      super.noSuchMethod(Invocation.setter(#error, _error),
          returnValueForMissingStub: null);
  @override
  _i5.RxString get errorMessage =>
      (super.noSuchMethod(Invocation.getter(#errorMessage),
          returnValue: _FakeRxString_6()) as _i5.RxString);
  @override
  set errorMessage(_i5.RxString? _errorMessage) =>
      super.noSuchMethod(Invocation.setter(#errorMessage, _errorMessage),
          returnValueForMissingStub: null);
  @override
  _i6.Future<void> getCustomerData(
          {dynamic Function(_i4.Customer)? onSuccess}) =>
      (super.noSuchMethod(
          Invocation.method(#getCustomerData, [], {#onSuccess: onSuccess}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  void updateBalance(int? value) =>
      super.noSuchMethod(Invocation.method(#updateBalance, [value]),
          returnValueForMissingStub: null);
  @override
  void update([List<Object>? ids, bool? condition = true]) =>
      super.noSuchMethod(Invocation.method(#update, [ids, condition]),
          returnValueForMissingStub: null);
  @override
  void onInit() => super.noSuchMethod(Invocation.method(#onInit, []),
      returnValueForMissingStub: null);
  @override
  void onReady() => super.noSuchMethod(Invocation.method(#onReady, []),
      returnValueForMissingStub: null);
  @override
  void onClose() => super.noSuchMethod(Invocation.method(#onClose, []),
      returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
  @override
  void $configureLifeCycle() =>
      super.noSuchMethod(Invocation.method(#$configureLifeCycle, []),
          returnValueForMissingStub: null);
  @override
  _i9.Disposer addListener(_i9.GetStateUpdate? listener) =>
      (super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValue: () {}) as _i9.Disposer);
  @override
  void removeListener(_i10.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void refresh() => super.noSuchMethod(Invocation.method(#refresh, []),
      returnValueForMissingStub: null);
  @override
  void refreshGroup(Object? id) =>
      super.noSuchMethod(Invocation.method(#refreshGroup, [id]),
          returnValueForMissingStub: null);
  @override
  void notifyChildrens() =>
      super.noSuchMethod(Invocation.method(#notifyChildrens, []),
          returnValueForMissingStub: null);
  @override
  void removeListenerId(Object? id, _i10.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListenerId, [id, listener]),
          returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  _i9.Disposer addListenerId(Object? key, _i9.GetStateUpdate? listener) =>
      (super.noSuchMethod(Invocation.method(#addListenerId, [key, listener]),
          returnValue: () {}) as _i9.Disposer);
  @override
  void disposeId(Object? id) =>
      super.noSuchMethod(Invocation.method(#disposeId, [id]),
          returnValueForMissingStub: null);
  @override
  _i6.Future<T> run<T>(_i11.ExecuteCallback<T>? fn, {dynamic errorMessage}) =>
      (super.noSuchMethod(
          Invocation.method(#run, [fn], {#errorMessage: errorMessage}),
          returnValue: Future<T>.value(null)) as _i6.Future<T>);
}

/// A class which mocks [ClientGraphQL].
///
/// See the documentation for Mockito's code generation for more information.
class MockClientGraphQL extends _i1.Mock implements _i12.ClientGraphQL {
  MockClientGraphQL() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<dynamic> mutate({String? query}) =>
      (super.noSuchMethod(Invocation.method(#mutate, [], {#query: query}),
          returnValue: Future<dynamic>.value()) as _i6.Future<dynamic>);
  @override
  _i6.Future<dynamic> query({String? query}) =>
      (super.noSuchMethod(Invocation.method(#query, [], {#query: query}),
          returnValue: Future<dynamic>.value()) as _i6.Future<dynamic>);
  @override
  String toString() => super.toString();
}
