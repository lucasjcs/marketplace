import '../../domain/entity/entity.dart';

abstract class MakePurshaseInteractor {
  Future<PurchaseResponse> execute({required String offerId});
}
