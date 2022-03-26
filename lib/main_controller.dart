import 'package:get/get.dart';
import 'package:gocery_partner/core/service/notification/notification.dart';

class MainController extends GetxController {
  final _notification = Get.find<NotificationImpl>();

  RxBool isAppInForeground = true.obs;

  @override
  void onInit() {
    ever(isAppInForeground, (bool status) {
      if (!status) {
        _notification.service();
      } else {
        _notification.closeService();
      }
    });

    super.onInit();
  }
}
