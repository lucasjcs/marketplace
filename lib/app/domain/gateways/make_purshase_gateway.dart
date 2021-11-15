import '../../domain/entity/entity.dart';

abstract class MakePurshaseGateway {
  Future<PurchaseResponse> makePurshase({required String offerId});
}
