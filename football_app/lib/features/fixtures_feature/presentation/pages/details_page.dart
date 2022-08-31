import 'package:flutter/material.dart';
import 'package:football_app/features/fixtures_feature/domain/entities/fixtures.dart';

class DetailsPage extends StatelessWidget {
/*   final Fixtures fixtures;
  const DetailsPage({Key? key, required this.fixtures}) : super(key: key);
 */
  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Fixtures = routeArgument['fixtures'];

    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Container(
          child: Center(
        child: Text("Details Page"),
      )),
    );
  }
}
