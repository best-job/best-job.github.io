import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_app/core/strings/route.dart';
import 'package:football_app/features/fixtures_feature/domain/entities/fixtures.dart';
import 'package:football_app/features/fixtures_feature/presentation/pages/details_page.dart';

import 'features/fixtures_feature/presentation/pages/fixtures_page.dart';

class AppRouter {
  Route? generateRaute(RouteSettings settings) {
    switch (settings.name) {
      case fixtureRoute:
        return MaterialPageRoute(builder: (_) => FixturesPage());
      case detailsRoute:
        return MaterialPageRoute(builder: (_) => DetailsPage());
    }
  }
}
