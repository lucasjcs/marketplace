import '../../domain/entity/entity.dart';
import '../../domain/model/model.dart';

class PurchaseResponseModel extends PurchaseResponse {
  final CustomerModel? customer;
  final String? errorMessage;
  final bool success;

  const PurchaseResponseModel({
    required this.success,
    this.errorMessage,
    this.customer,
  }) : super(
          customer: customer,
          errorMessage: errorMessage,
          success: success,
        );

  factory PurchaseResponseModel.fromJson(Map<String, dynamic> json) {
    return PurchaseResponseModel(
      success: json['success'],
      errorMessage: json['errorMessage'] ?? '',
      customer: json['customer'] != null
          ? CustomerModel.fromJson(json['customer'])
          : null,
    );
  }
}
