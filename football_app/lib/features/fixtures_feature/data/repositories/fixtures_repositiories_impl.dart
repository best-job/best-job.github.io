import 'dart:math';

import 'package:football_app/core/error/exceptions.dart';
import 'package:football_app/features/fixtures_feature/data/datasources/fixtures_local_data_source.dart';
import 'package:football_app/features/fixtures_feature/data/datasources/fixtures_remote_data_source.dart';
import 'package:football_app/features/fixtures_feature/data/models/fixtures_model.dart';
import 'package:football_app/features/fixtures_feature/domain/entities/fixtures.dart';
import 'package:football_app/core/error/failutes.dart';
import 'package:dartz/dartz.dart';
import 'package:football_app/features/fixtures_feature/domain/repositories/fixtures_repositories.dart';

import '../../../../core/check/network_info.dart';

class FixturesRepositoriesImpl implements FixturesRepositories {
  FixturesLocalDataSource fixturesLocalDataSource;
  FixturesRemoteDataSource fixturesRemoteDataSource;
  NetworkInfo networkInfo;
  FixturesRepositoriesImpl({
    required this.fixturesLocalDataSource,
    required this.fixturesRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Fixtures>>> getApiFixtures(isFinished) async {
    bool ntworkBool = await networkInfo.isConnected;
    //bool ntworkBool = true;
    if (ntworkBool) {
      try {
        final remoteFixture = await fixturesRemoteDataSource.gatApiFixtures();
        final List<FixturesModel> finishedMatch = [];
        final List<FixturesModel> notStartMatch = [];

        for (int i = 0; i < remoteFixture.length; i++) {
          if (remoteFixture[i].status == "Match Finished") {
            finishedMatch.add(remoteFixture[i]);
          } else {
            notStartMatch.add(remoteFixture[i]);
          }
        }

        //fixturesLocalDataSource.cacheFixture(remoteFixture);
        if (isFinished) {
          return right(finishedMatch);
        } else {
          return right(notStartMatch);
        }
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localFixture =
            await fixturesLocalDataSource.gatApiFixturesCache();
        return right(localFixture);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }
}
