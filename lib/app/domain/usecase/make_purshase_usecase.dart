import 'package:marketplace_nuconta/app/domain/gateways/gateways.dart';

import '../entity/purchase_response.dart';
import '../../domain/interactor/make_purchase_interactor.dart';

class MakePurchaseUseCase implements MakePurchaseInteractor {
  final MakePurchaseGateway makePurchaseGateway;

  MakePurchaseUseCase({required this.makePurchaseGateway});

  @override
  Future<PurchaseResponse> execute({required String offerId}) async {
    return await this.makePurchaseGateway.makePurchase(offerId: offerId);
  }
}
