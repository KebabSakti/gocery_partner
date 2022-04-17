import 'package:gocery_partner/feature/order/domain/repository/order_repository.dart';

class AcceptOrder {
  AcceptOrder({required this.repository});

  final OrderRepository repository;

  Future<void> call({required String orderUid}) async {
    await repository.acceptOrder(orderUid: orderUid);
  }
}
