abstract class OrderRepository {
  Future<void> acceptOrder({required String orderUid});

  Future<void> rejectOrder({required String orderUid});
}
