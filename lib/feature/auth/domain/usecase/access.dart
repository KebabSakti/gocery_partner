import 'package:gocery_partner/feature/auth/domain/entity/access_param.dart';
import 'package:gocery_partner/feature/auth/domain/repository/auth_repository.dart';

class Access {
  Access({required this.repository});

  final AuthRepository repository;

  Future<void> call({required AccessParam param}) async {
    await repository.access(param: param);
  }
}
