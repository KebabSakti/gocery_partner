import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:gocery_partner/core/config/app_const.dart';
import 'package:gocery_partner/core/model/response_model.dart';
import 'package:gocery_partner/core/service/error/map_exception_message.dart';
import 'package:gocery_partner/core/service/notification/notification.dart';
import 'package:gocery_partner/core/service/websocket/websocket.dart';
import 'package:gocery_partner/core/utility/mdialog.dart';
import 'package:gocery_partner/core/utility/mtoast.dart';
import 'package:gocery_partner/feature/account/data/repository/account_repository_impl.dart';
import 'package:gocery_partner/feature/account/domain/usecase/get_user_account.dart';
import 'package:gocery_partner/feature/account/domain/usecase/udpate_status.dart';
import 'package:gocery_partner/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:gocery_partner/feature/auth/domain/entity/partner_entity.dart';
import 'package:gocery_partner/feature/auth/domain/usecase/revoke.dart';
import 'package:gocery_partner/feature/order/data/repository/order_repository_impl.dart';
import 'package:gocery_partner/feature/order/domain/usecase/accept_order.dart';
import 'package:gocery_partner/feature/order/domain/usecase/reject_order.dart';
import 'package:gocery_partner/main_controller.dart';
import 'package:pusher_client/pusher_client.dart';

class HomePageController extends GetxController {
  AudioPlayer? player;

  final AudioCache audioPlayer = AudioCache(prefix: 'asset/audio/');

  final _app = Get.find<MainController>();

  final _websocket = Get.find<WebsocketImpl>();
  final _notification = Get.find<NotificationImpl>();

  final _revokeUsecase = Revoke(repository: Get.find<AuthRepositoryImpl>());
  final _getUserAccountUsecase =
      GetUserAccount(repository: Get.find<AccountRepositoryImpl>());
  final _updateStatusUsecase =
      UpdateStatus(repository: Get.find<AccountRepositoryImpl>());
  final _acceptOrderUsecase =
      AcceptOrder(repository: Get.find<OrderRepositoryImpl>());
  final _rejectOrderUsecase =
      RejectOrder(repository: Get.find<OrderRepositoryImpl>());

  final userAccountState =
      ResponseModel<PartnerEntity>(status: Status.loading).obs;

  final websocketData = {}.obs;

  Future<void> getUserAccount() async {
    try {
      userAccountState(ResponseModel<PartnerEntity>(status: Status.loading));

      PartnerEntity model = await _getUserAccountUsecase();

      userAccountState(
          ResponseModel<PartnerEntity>(status: Status.success, data: model));

      websocket();
    } on Exception catch (e) {
      MToast.show(MapExceptionMessage.exception(e));

      userAccountState(ResponseModel<PartnerEntity>(status: Status.error));
    }
  }

  Future<void> updateStatus({required String param}) async {
    try {
      MDialog.loading();

      await _updateStatusUsecase(param: param);

      var profile = userAccountState()
          .data!
          .couriers![0]
          .courierProfileEntity!
          .copyWith(status: param);

      var account = userAccountState()
          .data!
          .couriers![0]
          .copyWith(courierProfileEntity: profile);

      var partner = userAccountState().data!.copyWith(couriers: [account]);

      userAccountState(
          ResponseModel<PartnerEntity>(status: Status.success, data: partner));

      MDialog.close();
    } on Exception catch (e) {
      MDialog.close();

      MToast.show(MapExceptionMessage.exception(e));
    }
  }

  Future<void> revoke() async {
    try {
      MDialog.loading();

      await _revokeUsecase();

      await _websocket.close(
          channelName: 'partner.' + userAccountState().data!.uid!);

      _toIntroPage();
    } on Exception catch (e) {
      MDialog.close();

      MToast.show(MapExceptionMessage.exception(e));
    }
  }

  Future<void> acceptOrder({required String orderUid}) async {
    try {
      MDialog.loading();

      await _acceptOrderUsecase(orderUid: orderUid);

      await getUserAccount();

      MDialog.close();

      websocketData({});
    } on Exception catch (e) {
      MDialog.close();

      MToast.show(MapExceptionMessage.exception(e));
    }
  }

  Future<void> rejectOrder({required String orderUid}) async {
    try {
      MDialog.loading();

      await _rejectOrderUsecase(orderUid: orderUid);

      await getUserAccount();

      MDialog.close();

      websocketData({});
    } on Exception catch (e) {
      MDialog.close();

      MToast.show(MapExceptionMessage.exception(e));
    }
  }

  Future<void> playSound() async {
    await stopSound();

    player = await audioPlayer.play(kNotificationSound);
  }

  Future<void> stopSound() async {
    if (player != null) {
      await player!.stop();
    }
  }

  void websocket() async {
    await _websocket.listen(
      channelName: 'private-partner.' + userAccountState().data!.uid!,
      eventName: 'CourierRequestStatusEvent',
      onEvent: (event) async {
        if (userAccountState()
                .data!
                .couriers![0]
                .courierProfileEntity!
                .status !=
            'OFFLINE') {
          if (!_app.isAppInForeground()) {
            _notification.order();
          } else {
            await playSound();
          }

          final PusherEvent e = event as PusherEvent;

          var json = jsonDecode(e.data!);

          websocketData(json);

          // websocketData(Utility.prettyJSON(json));
        }
      },
    );
  }

  void _toIntroPage() {
    Get.offAllNamed(kIntroPage);
  }

  void init() async {
    await getUserAccount();

    // websocket();
  }

  @override
  void onInit() {
    init();

    super.onInit();
  }
}
