import 'package:get/get.dart';

import '../../domain/entity/entity.dart';
import '../../domain/usecase/get_customer_data_usecase.dart';
import '../../ui/pages/page_state.dart';

class AppController extends GetxController with PageState {
  final GetCustomerDataUseCase getCustomerDataUseCase;

  AppController({required this.getCustomerDataUseCase});

  late var customer = Rx<Customer?>(null);

  Future<void> getCustomerData() async {
    customer.value = await this.run<Customer?>(
      () => getCustomerDataUseCase.execute(),
      errorMessage: 'something went wrong. please try again',
    );
  }
}
