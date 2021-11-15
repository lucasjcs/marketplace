import 'customer.dart';

class PurchaseResponse {
  final Customer? customer;
  final String errorMessage;
  final bool success;

  const PurchaseResponse({
    this.customer,
    required this.success,
    required this.errorMessage,
  });
}
