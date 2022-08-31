import 'package:football_app/core/check/network_info.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/fixtures_feature/data/datasources/fixtures_local_data_source.dart';
import 'features/fixtures_feature/data/datasources/fixtures_remote_data_source.dart';
import 'features/fixtures_feature/data/repositories/fixtures_repositiories_impl.dart';
import 'features/fixtures_feature/domain/repositories/fixtures_repositories.dart';
import 'features/fixtures_feature/domain/usecases/get_api.dart';
import 'features/fixtures_feature/presentation/bloc/fixtures/fixtures_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features - posts

// Bloc

  sl.registerFactory(() => FixturesBloc(getAllFixtures: sl()));

// Repository

  sl.registerLazySingleton<FixturesRepositories>(() => FixturesRepositoriesImpl(
        fixturesLocalDataSource: sl(),
        fixturesRemoteDataSource: sl(),
        networkInfo: sl(),
      ));

  // Usecases

  sl.registerLazySingleton(() => GetApiFixturesUseCase(sl()));

// Datasources

  sl.registerLazySingleton<FixturesRemoteDataSource>(
      () => gatApiFixturesWithDioImp());
  sl.registerLazySingleton<FixturesLocalDataSource>(
      () => FixturesLocalDataSourceImp(sharedPreferences: sl()));

//! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

//! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
