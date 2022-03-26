import 'package:get/get.dart';
import 'package:gocery_partner/core/config/app_const.dart';
import 'package:gocery_partner/core/service/error/network_exception.dart';
import 'package:gocery_partner/core/service/notification/notification.dart';
import 'package:gocery_partner/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:gocery_partner/feature/auth/domain/usecase/user_is_authenticated.dart';

class LandingPageController extends GetxController {
  final _notification = Get.find<NotificationImpl>();
  final _userIsAuthenticatedUsecase =
      UserIsAuthenticated(repository: Get.find<AuthRepositoryImpl>());

  Future<void> userIsAuthenticated() async {
    try {
      bool authenticated = await _userIsAuthenticatedUsecase();

      if (!authenticated) {
        throw Unauthenticated();
      }

      _toHomePage();
    } on Exception catch (_) {
      _toIntroPage();
    }
  }

  void _toHomePage() {
    Get.offAllNamed(kHomePage);
  }

  void _toIntroPage() {
    Get.offAllNamed(kIntroPage);
  }

  void init() {
    userIsAuthenticated();
  }

  void initListener() {
    _notification.listen((receivedNotification) {
      receivedNotification;
    });
  }

  @override
  void onInit() {
    initListener();

    init();

    super.onInit();
  }
}
