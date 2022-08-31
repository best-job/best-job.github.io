import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/features/fixtures_feature/presentation/bloc/fixtures/fixtures_bloc.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/message_display_widget.dart';
import '../widgets/fixtures_list_widget.dart';

class FixturesPage extends StatelessWidget {
  const FixturesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Fixtures")), body: _buildBudy());
  }

  Widget _buildBudy() {
    return Padding(
        padding: EdgeInsets.all(10),
        child: BlocBuilder<FixturesBloc, FixturesState>(
          builder: (context, state) {
            if (state is LoadingFixturesState) {
              return LoadingWidget();
            } else if (state is LoadedFixturessState) {
              return FixturesListWidget(list: state.fixtures);
            } else if (state is ErrorFixturesState) {
              return MessageDisplayWidget(message: state.message);
            }
            return LoadingWidget();
          },
        ));
  }
}
