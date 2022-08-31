import 'package:flutter/material.dart';

import '../../../../core/strings/route.dart';
import '../../domain/entities/fixtures.dart';
import '../pages/details_page.dart';
import 'fixtures_item_wedget.dart';

class FixturesListWidget extends StatelessWidget {
  final List<Fixtures> list;
  const FixturesListWidget({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => FixturesItemWedget(
              itemIndex: index,
              fixtures: list[index],
              press: () {
                Navigator.of(context).pushNamed(detailsRoute,
                    arguments: {'fixtures': list[index]});
              },
            ));
  }
}
