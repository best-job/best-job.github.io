import 'dart:convert' as convert;
import 'dart:convert';

import 'package:football_app/features/fixtures_feature/data/models/fixtures_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';

String API_PATH =
    "https://v3.football.api-sports.io/fixtures?league=128&season=2022";

abstract class FixturesRemoteDataSource {
  Future<List<FixturesModel>> gatApiFixtures();
}

class gatApiFixturesWithDioImp implements FixturesRemoteDataSource {
  @override
  Future<List<FixturesModel>> gatApiFixtures() async {
    try {
      var headersDio = {
        'x-rapidapi-key': '1adac3bae16caa8963e89bab2fe98910',
        'x-rapidapi-host': 'v3.football.api-sports.io'
      };
      Response response =
          await Dio().get(API_PATH, options: Options(headers: headersDio));

      final List responsp = response.data["response"];
      final List<FixturesModel> fixturesModels = responsp
          .map((jsonPostModel) => FixturesModel.fromJson(jsonPostModel))
          .toList();

      return fixturesModels;
    } catch (e) {
      throw ServerException();
    }
    throw UnimplementedError();
  }
}
