import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gocery_partner/core/config/app_const.dart';
import 'package:gocery_partner/core/config/app_icons.dart';
import 'package:gocery_partner/core/model/response_model.dart';
import 'package:gocery_partner/feature/auth/domain/entity/access_param.dart';
import 'package:gocery_partner/feature/auth/domain/entity/partner_entity.dart';
import 'package:gocery_partner/feature/intro/presentation/controller/intro_page_controller.dart';

class IntroPage extends GetView<IntroPageController> {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        controller.init();
      },
      child: Scaffold(
        backgroundColor: kLightColor,
        appBar: AppBar(title: const Text('Pilih Salah Satu')),
        body: Obx(() {
          final partnersState = controller.partnersState();

          if (partnersState.status == Status.success) {
            final List<PartnerEntity> partners = partnersState.data!;

            return ListView.separated(
              itemCount: partners.length,
              separatorBuilder: (context, index) => const Divider(height: 0),
              itemBuilder: (context, index) => ExpansionTile(
                title:
                    Text(partners[index].name!, style: Get.textTheme.headline3),
                subtitle: Text(partners[index].shipping!),
                children: partners[index]
                    .couriers!
                    .map((e) => ListTile(
                          leading: const Icon(AppIcon.arrowcircleright),
                          title: Text(
                            e.courierProfileEntity!.name!,
                            style: Get.textTheme.bodyText1,
                          ),
                          subtitle: Text(
                            e.courierProfileEntity!.email!,
                            style: Get.textTheme.bodyText1,
                          ),
                          onTap: () {
                            controller.access(
                                param: AccessParam(
                                    username: e.username!, password: '12345'));
                          },
                        ))
                    .toList(),
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
