import 'package:football_app/features/fixtures_feature/domain/entities/fixtures.dart';

//extends from Fixture in Entities
class FixturesModel extends Fixtures {
  const FixturesModel(
      {required super.match_id,
      required super.match_referee,
      required super.match_date,
      required super.status,
      required super.home_name,
      required super.home_logo,
      required super.home_goal,
      required super.away_name,
      required super.away_logo,
      required super.away_goal});

  factory FixturesModel.fromJson(Map<String, dynamic> json) {
    return FixturesModel(
        match_id: json["fixture"]["id"],
        match_referee: json["fixture"]["referee"],
        match_date: json["fixture"]["date"],
        status: json["fixture"]["status"]["long"],
        home_name: json["teams"]["home"]["name"],
        home_logo: json["teams"]["home"]["logo"],
        home_goal: json["goals"]["home"],
        away_name: json["teams"]["away"]["name"],
        away_logo: json["teams"]["away"]["logo"],
        away_goal: json["goals"]["away"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'match_id': match_id,
      'match_referee': match_referee,
      'match_date': match_date,
      'status': status,
      'home_name': home_name,
      'home_logo': home_logo,
      'home_goal': home_goal,
      'away_name': away_name,
      'away_logo': away_logo,
      'away_goal': away_goal
    };
  }
}
