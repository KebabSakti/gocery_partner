import 'package:get/get.dart';
import 'package:gocery_partner/core/config/app_const.dart';
import 'package:gocery_partner/core/model/response_model.dart';
import 'package:gocery_partner/core/service/error/map_exception_message.dart';
import 'package:gocery_partner/core/utility/mdialog.dart';
import 'package:gocery_partner/core/utility/mtoast.dart';
import 'package:gocery_partner/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:gocery_partner/feature/auth/domain/entity/access_param.dart';
import 'package:gocery_partner/feature/auth/domain/entity/partner_entity.dart';
import 'package:gocery_partner/feature/auth/domain/usecase/access.dart';
import 'package:gocery_partner/feature/auth/domain/usecase/partners.dart';

class IntroPageController extends GetxController {
  final _partnersUsecase = Partners(repository: Get.find<AuthRepositoryImpl>());
  final _accessUsecase = Access(repository: Get.find<AuthRepositoryImpl>());

  final partnersState =
      ResponseModel<List<PartnerEntity>>(status: Status.loading).obs;

  Future<void> partners() async {
    try {
      partnersState(ResponseModel<List<PartnerEntity>>(status: Status.loading));

      List<PartnerEntity> models = await _partnersUsecase();

      if (models.isEmpty) {
        partnersState(ResponseModel<List<PartnerEntity>>(status: Status.empty));
      } else {
        partnersState(ResponseModel<List<PartnerEntity>>(
            status: Status.success, data: models));
      }
    } on Exception catch (e) {
      MToast.show(MapExceptionMessage.exception(e));

      partnersState(ResponseModel<List<PartnerEntity>>(status: Status.error));
    }
  }

  Future<void> access({required AccessParam param}) async {
    try {
      MDialog.loading();

      await _accessUsecase(param: param);

      _toHomePage();
    } on Exception catch (e) {
      MDialog.close();

      MToast.show(MapExceptionMessage.exception(e));
    }
  }

  void _toHomePage() {
    Get.offAllNamed(kHomePage);
  }

  void init() async {
    partners();
  }

  @override
  void onInit() {
    init();

    super.onInit();
  }
}
