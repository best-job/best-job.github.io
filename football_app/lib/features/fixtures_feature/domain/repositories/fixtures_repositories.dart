import 'package:football_app/features/fixtures_feature/domain/entities/fixtures.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failutes.dart';

abstract class FixturesRepositories {
  Future<Either<Failure, List<Fixtures>>> getApiFixtures(bool isfinished);
}
