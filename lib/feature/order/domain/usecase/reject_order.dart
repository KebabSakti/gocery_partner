import 'package:gocery_partner/feature/order/domain/repository/order_repository.dart';

class RejectOrder {
  RejectOrder({required this.repository});

  final OrderRepository repository;

  Future<void> call({required String orderUid}) async {
    await repository.rejectOrder(orderUid: orderUid);
  }
}
