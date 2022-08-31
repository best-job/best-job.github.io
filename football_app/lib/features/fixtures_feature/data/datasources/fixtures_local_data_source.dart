import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:football_app/features/fixtures_feature/data/models/fixtures_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';

const CACHED_Fixtures = "CACHED_Fixtures";

abstract class FixturesLocalDataSource {
  Future<List<FixturesModel>> gatApiFixturesCache();
  Future<Unit> cacheFixture(List<FixturesModel> fixturesModel);
}

class FixturesLocalDataSourceImp implements FixturesLocalDataSource {
  final SharedPreferences sharedPreferences;
  FixturesLocalDataSourceImp({required this.sharedPreferences});

  @override
  Future<Unit> cacheFixture(List<FixturesModel> fixturesModel) {
    List fixturesModelsToJson = fixturesModel
        .map<Map<String, dynamic>>((postModel) => postModel.toJson())
        .toList();
    sharedPreferences.setString(
        CACHED_Fixtures, json.encode(fixturesModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<FixturesModel>> gatApiFixturesCache() {
    final jsonString = sharedPreferences.getString(CACHED_Fixtures);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<FixturesModel> jsonToPostModels = decodeJsonData
          .map<FixturesModel>(
              (jsonPostModel) => FixturesModel.fromJson(jsonPostModel))
          .toList();
      return Future.value(jsonToPostModels);
    } else {
      throw EmptyCacheException();
    }
  }
}
