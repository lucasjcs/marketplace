import 'dart:async';

import 'package:get/get.dart';

typedef ExecuteCallback<T> = Future<T> Function();

mixin PageState {
  var loading = false.obs;
  var error = false.obs;
  var errorMessage = ''.obs;

  Future<T> run<T>(
    ExecuteCallback<T> fn, {
    errorMessage,
  }) async {
    var result;
    try {
      this.error.value = false;
      this.loading.value = true;
      await Future.delayed(Duration(seconds: 1));
      result = await fn();
    } catch (error) {
      this.error.value = true;
    } finally {
      this.loading.value = false;
    }
    return result as T;
  }
}
