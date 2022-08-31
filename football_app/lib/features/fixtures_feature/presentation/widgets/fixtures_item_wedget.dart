import 'package:flutter/material.dart';
import 'package:football_app/features/fixtures_feature/domain/entities/fixtures.dart';

class FixturesItemWedget extends StatelessWidget {
  final int itemIndex;
  final Fixtures fixtures;
  final VoidCallback press;
  const FixturesItemWedget(
      {Key? key,
      required this.itemIndex,
      required this.fixtures,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(fixtures.home_name.toString()),
            SizedBox(
              width: 5,
            ),
            Text(fixtures.home_goal.toString()),
          ],
        ),
        Row(
          children: [
            Text(fixtures.away_name.toString()),
            SizedBox(
              width: 5,
            ),
            Text(fixtures.away_goal.toString()),
          ],
        ),
      ],
    );
  }
}
