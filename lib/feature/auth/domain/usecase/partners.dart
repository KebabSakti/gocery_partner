import 'package:gocery_partner/feature/auth/domain/entity/partner_entity.dart';
import 'package:gocery_partner/feature/auth/domain/repository/auth_repository.dart';

class Partners {
  Partners({required this.repository});

  final AuthRepository repository;

  Future<List<PartnerEntity>> call() async {
    return await repository.partners();
  }
}
