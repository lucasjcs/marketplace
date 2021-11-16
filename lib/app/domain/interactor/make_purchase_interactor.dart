import '../../domain/entity/entity.dart';

abstract class MakePurchaseInteractor {
  Future<PurchaseResponse> execute({required String offerId});
}
