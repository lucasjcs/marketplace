import 'package:get/get.dart';
import '../../../domain/usecase/get_customer_data_usecase.dart';

class HomeController extends GetxController {
  final GetCustomerDataUseCase useCase;

  HomeController({required this.useCase});

  RxBool loading = RxBool(false);
  RxBool error = RxBool(false);

  getCustomerData() async {
    this.loading.value = true;
    final response = await useCase.execute();
    return response;
  }
}
