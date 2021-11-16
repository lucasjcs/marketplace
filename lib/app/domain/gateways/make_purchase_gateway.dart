import '../../domain/entity/entity.dart';

abstract class MakePurchaseGateway {
  Future<PurchaseResponse> makePurchase({required String offerId});
}
