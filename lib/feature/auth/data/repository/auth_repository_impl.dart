import 'package:gocery_partner/feature/auth/data/datasource/auth_datasource.dart';
import 'package:gocery_partner/feature/auth/domain/entity/access_param.dart';
import 'package:gocery_partner/feature/auth/domain/entity/partner_entity.dart';
import 'package:gocery_partner/feature/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.datasource});

  final AuthDatasource datasource;

  @override
  Future<List<PartnerEntity>> partners() async {
    return await datasource.partners();
  }

  @override
  Future<void> access({required AccessParam param}) async {
    await datasource.access(param: param);
  }

  @override
  Future<void> revoke() async {
    await datasource.revoke();
  }

  @override
  Future<bool> userIsAuthenticated() async {
    return datasource.userIsAuthenticated();
  }
}
