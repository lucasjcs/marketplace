import 'package:get/get.dart';
import 'package:marketplace_nuconta/app/ui/constants/constants.dart';

import '../../domain/entity/entity.dart';
import '../../domain/usecase/get_customer_data_usecase.dart';
import '../mixins/page_state.dart';

class AppController extends GetxController with PageState {
  final GetCustomerDataUseCase getCustomerDataUseCase;

  AppController({required this.getCustomerDataUseCase});

  Rx<Customer?> _customer = Rx<Customer?>(null);

  Future<void> getCustomerData({
    required Function(Customer) onSuccess,
  }) async {
    _customer.value = await this.run<Customer?>(
      () => getCustomerDataUseCase.execute(),
      errorMessage: Strings.default_error_message,
    );

    if (!this.error.value && _customer.value != null) {
      onSuccess(_customer.value!);
    }
  }

  void updateBalance(int value) {
    this._customer.value!.balance = value;
    this._customer.refresh();
  }

  Customer get customer => this._customer.value!;
  void set customer(Customer value) => this._customer.value = value;
}
