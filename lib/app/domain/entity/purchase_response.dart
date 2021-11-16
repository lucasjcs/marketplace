import 'customer.dart';

class PurchaseResponse {
  final Customer? customer;
  final String? errorMessage;
  final bool success;

  const PurchaseResponse({
    required this.success,
    this.errorMessage,
    this.customer,
  });
}
