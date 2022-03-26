import 'package:get/get.dart';
import 'package:gocery_partner/core/service/network/network.dart';
import 'package:gocery_partner/core/service/storage/storage.dart';
import 'package:gocery_partner/feature/account/data/datasource/remote/account_remote_datasource.dart';
import 'package:gocery_partner/feature/account/data/repository/account_repository_impl.dart';
import 'package:gocery_partner/feature/auth/data/datasource/remote/auth_remote_datasource.dart';
import 'package:gocery_partner/feature/auth/data/repository/auth_repository_impl.dart';

class Dependency extends Bindings {
  @override
  void dependencies() {
    //AUTHENTICATION
    Get.lazyPut(
      () => AuthRepositoryImpl(
        datasource: AuthRemoteDatasource(
          client: Get.find<NetworkImpl>(),
          storage: Get.find<SecureStorageImpl>(),
        ),
      ),
      fenix: true,
    );

    //ACCOUNT
    Get.lazyPut(
      () => AccountRepositoryImpl(
          datasource: AccountRemoteDatasource(client: Get.find<NetworkImpl>())),
      fenix: true,
    );
  }
}
