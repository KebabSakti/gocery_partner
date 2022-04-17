import 'package:gocery_partner/feature/order/data/datasource/order_datasource.dart';
import 'package:gocery_partner/feature/order/domain/repository/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  OrderRepositoryImpl({required this.datasource});

  final OrderDatasource datasource;

  @override
  Future<void> acceptOrder({required String orderUid}) async {
    await datasource.acceptOrder(orderUid: orderUid);
  }

  @override
  Future<void> rejectOrder({required String orderUid}) async {
    await datasource.rejectOrder(orderUid: orderUid);
  }
}
