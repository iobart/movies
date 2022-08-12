import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/src/app/features/presentation/pages/login/login_page.dart';
import 'package:movies/src/app/navigator.dart';
import 'package:movies/src/app/utils/app_theme.dart';
import 'package:movies/injection_dependency_container.dart' as di;
import 'package:movies/src/app/features/presentation/bloc/tv_show/tv_show_bloc.dart';
void main() async {
  WidgetsFlutterBinding
      .ensureInitialized();
  await di.init(); // Initialize the dependency injection container
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final tvShowBloc = di.sl<TvShowBloc>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => tvShowBloc),
      ],
      child: MaterialApp(
        title: '',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouterGenerator.generateRoute,
        theme: AppTheme.dark(),
        themeMode: ThemeMode.dark,
        home:  LoginPage(),
      ),
    );
  }
}
