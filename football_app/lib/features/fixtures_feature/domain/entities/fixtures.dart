import 'package:equatable/equatable.dart';

class Fixtures extends Equatable {
  final match_id;
  final match_referee;
  final match_date;
  final status;
  final home_name;
  final home_logo;
  final home_goal;
  final away_name;
  final away_logo;
  final away_goal;

  const Fixtures(
      {required this.match_id,
      required this.match_referee,
      required this.match_date,
      required this.status,
      required this.home_name,
      required this.home_logo,
      required this.home_goal,
      required this.away_name,
      required this.away_logo,
      required this.away_goal});

  @override
  List<Object?> get props => [
        match_id,
        match_referee,
        match_date,
        status,
        home_name,
        home_logo,
        home_goal,
        away_name,
        away_logo,
        away_goal
      ];
}
