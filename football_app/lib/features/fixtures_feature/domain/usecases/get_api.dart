import 'package:dartz/dartz.dart';
import 'package:football_app/features/fixtures_feature/domain/repositories/fixtures_repositories.dart';

import '../../../../core/error/failutes.dart';
import '../entities/fixtures.dart';

class GetApiFixturesUseCase {
  final FixturesRepositories repositories;
  GetApiFixturesUseCase(this.repositories);
  Future<Either<Failure, List<Fixtures>>> call(bool isfinished) async {
    return await repositories.getApiFixtures(isfinished);
  }
}
