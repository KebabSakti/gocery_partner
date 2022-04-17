import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gocery_partner/core/config/app_const.dart';
import 'package:gocery_partner/core/config/app_icons.dart';
import 'package:gocery_partner/core/model/response_model.dart';
import 'package:gocery_partner/feature/auth/domain/entity/partner_entity.dart';
import 'package:gocery_partner/feature/home/presentation/controller/home_page_controller.dart';
import 'package:move_to_background/move_to_background.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        MoveToBackground.moveTaskToBack();

        return false;
      },
      child: Scaffold(
        backgroundColor: kLightColor,
        appBar: AppBar(
          title: const Text('Home Page'),
          actions: [
            IconButton(
              onPressed: () {
                controller.revoke();
              },
              icon: const Icon(AppIcon.signout),
            ),
          ],
        ),
        body: GestureDetector(
          onTap: () {
            controller.stopSound();
          },
          child: Obx(() {
            final accountState = controller.userAccountState();

            if (accountState.status == Status.success) {
              return Column(
                children: [
                  _accountBody(controller),
                  _eventBody(controller),
                ],
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
        ),
      ),
    );
  }
}

Widget _accountBody(HomePageController controller) {
  final PartnerEntity user = controller.userAccountState().data!;

  return Padding(
    padding: const EdgeInsets.all(kMediumPadding),
    child: Column(
      children: [
        Row(
          children: [
            Text(
              'Partner : ',
              style: Get.textTheme.bodyText1,
            ),
            Text(
              user.name!,
              style: Get.textTheme.bodyText1,
            ),
          ],
        ),
        const SizedBox(height: kSmallPadding),
        Row(
          children: [
            Text(
              'Pengiriman : ',
              style: Get.textTheme.bodyText1,
            ),
            Text(
              user.shipping!,
              style: Get.textTheme.bodyText1,
            ),
          ],
        ),
        const SizedBox(height: kSmallPadding),
        Row(
          children: [
            Text(
              'Jenis : ',
              style: Get.textTheme.bodyText1,
            ),
            Text(
              user.type!,
              style: Get.textTheme.bodyText1,
            ),
          ],
        ),
        const SizedBox(height: kSmallPadding),
        Row(
          children: [
            Text(
              'Kantor : ',
              style: Get.textTheme.bodyText1,
            ),
            Text(
              user.exclusive == 0 ? 'TIDAK' : 'YA',
              style: Get.textTheme.bodyText1,
            ),
          ],
        ),
        const SizedBox(height: kMediumPadding),
        const Divider(height: 0),
        const SizedBox(height: kMediumPadding),
        Row(
          children: [
            Text(
              'Nama : ',
              style: Get.textTheme.bodyText1,
            ),
            Text(
              user.couriers![0].courierProfileEntity!.name!,
              style: Get.textTheme.bodyText1,
            ),
          ],
        ),
        const SizedBox(height: kSmallPadding),
        Row(
          children: [
            Text(
              'Email : ',
              style: Get.textTheme.bodyText1,
            ),
            Text(
              user.couriers![0].courierProfileEntity!.email!,
              style: Get.textTheme.bodyText1,
            ),
          ],
        ),
        const SizedBox(height: kSmallPadding),
        Row(
          children: [
            Text(
              'Status : ',
              style: Get.textTheme.bodyText1,
            ),
            Text(
              user.couriers![0].courierProfileEntity!.status!,
              style: Get.textTheme.bodyText1!.copyWith(
                color: user.couriers![0].courierProfileEntity!.status == 'READY'
                    ? Colors.green
                    : Colors.red,
              ),
            ),
          ],
        ),
        const SizedBox(height: kMediumPadding),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              String status =
                  user.couriers![0].courierProfileEntity!.status == 'READY'
                      ? 'OFFLINE'
                      : 'READY';

              controller.updateStatus(param: status);
            },
            child: const Text('Toggle Status'),
          ),
        ),
      ],
    ),
  );
}

Widget _eventBody(HomePageController controller) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(kMediumPadding),
      child: Column(
        children: [
          Text(
            'Websocket Data',
            style: Get.textTheme.headline3,
          ),
          const Divider(),
          const SizedBox(height: kMediumPadding),
          Obx(() {
            return Expanded(
              child: SingleChildScrollView(
                child: (controller.websocketData().isEmpty)
                    ? const SizedBox.shrink()
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Anda mendapatkan orderan baru',
                            style: Get.textTheme.headline2,
                          ),
                          const SizedBox(height: kMediumPadding),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  controller.rejectOrder(
                                      orderUid:
                                          controller.websocketData()['uid']);
                                },
                                child: const Text('Tolak'),
                              ),
                              const SizedBox(width: kMediumPadding),
                              ElevatedButton(
                                onPressed: () {
                                  controller.acceptOrder(
                                      orderUid:
                                          controller.websocketData()['uid']);
                                },
                                child: const Text('Terima'),
                              ),
                            ],
                          ),
                        ],
                      ),
                // child: Text(
                //   controller.websocketData(),
                //   style: Get.textTheme.bodyText1,
                // ),
              ),
            );
          }),
        ],
      ),
    ),
  );
}
