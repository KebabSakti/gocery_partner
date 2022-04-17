import 'package:gocery_partner/core/config/app_const.dart';
import 'package:gocery_partner/core/service/network/network.dart';
import 'package:gocery_partner/feature/order/data/datasource/order_datasource.dart';

class OrderRemoteDatasource implements OrderDatasource {
  OrderRemoteDatasource({required this.client});

  final Network client;

  @override
  Future<void> acceptOrder({required String orderUid}) async {
    await client.post(kAcceptOrder, data: {'order_uid': orderUid});
  }

  @override
  Future<void> rejectOrder({required String orderUid}) async {
    await client.post(kRejectOrder, data: {'order_uid': orderUid});
  }
}
