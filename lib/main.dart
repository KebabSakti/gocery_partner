import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gocery_partner/core/config/app_const.dart';
import 'package:gocery_partner/core/config/app_route.dart';
import 'package:gocery_partner/core/config/app_theme.dart';
import 'package:gocery_partner/core/service/network/dio_client.dart';
import 'package:gocery_partner/core/service/network/network.dart';
import 'package:gocery_partner/core/service/notification/notification.dart';
import 'package:gocery_partner/core/service/notification/notification_service.dart';
import 'package:gocery_partner/core/service/storage/secure_storage_client.dart';
import 'package:gocery_partner/core/service/storage/storage.dart';
import 'package:gocery_partner/core/service/websocket/websocket.dart';
import 'package:gocery_partner/core/service/websocket/websocket_service.dart';
import 'package:gocery_partner/dependency.dart';
import 'package:gocery_partner/main_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initServices();

  runApp(const GoceryPartner());
}

class GoceryPartner extends StatefulWidget {
  const GoceryPartner({Key? key}) : super(key: key);

  @override
  State<GoceryPartner> createState() => _GoceryPartnerState();
}

class _GoceryPartnerState extends State<GoceryPartner>
    with WidgetsBindingObserver {
  late final MainController controller;

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);

    controller = Get.put(MainController());

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    controller.isAppInForeground.value = state == AppLifecycleState.resumed;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Gocery Partner',
      debugShowCheckedModeBanner: false,
      opaqueRoute: true,
      initialBinding: Dependency(),
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      getPages: AppRoute.routes,
      initialRoute: kLandingPage,
    );
  }
}

Future _initServices() async {
  Get.put(SecureStorageImpl(implementation: SecureStorageClient()));
  Get.put(NetworkImpl(implementation: DioClient()));
  Get.put(WebsocketImpl(implementation: WebsocketService()));
  Get.put(NotificationImpl(implementation: NotificationService()));
}
