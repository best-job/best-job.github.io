import 'package:flutter/material.dart';
import 'app_router.dart';
import 'core/app_theme.dart';
import 'features/fixtures_feature/presentation/bloc/fixtures/fixtures_bloc.dart';
import 'features/fixtures_feature/presentation/pages/fixtures_page.dart';
import 'injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => di.sl<FixturesBloc>()..add(GetAllFixturesEvent())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          title: 'Football App',
          onGenerateRoute: appRouter.generateRaute,
        ));
  }
}
