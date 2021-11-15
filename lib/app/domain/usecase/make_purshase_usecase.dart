import 'package:marketplace_nuconta/app/domain/gateways/gateways.dart';

import '../../domain/entity/purshase_response.dart';
import '../../domain/interactor/make_purchase_interactor.dart';

class MakePurshaseUseCase implements MakePurshaseInteractor {
  final MakePurshaseGateway makePurshaseGateway;

  MakePurshaseUseCase({required this.makePurshaseGateway});

  @override
  Future<PurchaseResponse> execute({required String offerId}) async {
    return await this.makePurshaseGateway.makePurshase(offerId: offerId);
  }
}
