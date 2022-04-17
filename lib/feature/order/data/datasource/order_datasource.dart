abstract class OrderDatasource {
  Future<void> acceptOrder({required String orderUid});

  Future<void> rejectOrder({required String orderUid});
}
