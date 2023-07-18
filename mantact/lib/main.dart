import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mantact/app/config/providers/app_providers.dart';
import 'package:mantact/app/config/routes/app_route.dart';
import 'package:mantact/app/config/theme/app_theme.dart';
import 'package:mantact/app/services/local_database_service/local_database.dart';
import 'package:mantact/app/utils/constants/app_strings.dart';
import 'package:mantact/features/contact_module/views/screens/contact_screen.dart';
import 'package:mantact/features/settings_module/bloc/settings_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

//Initialization of LocalDatabase (Hive)

  final localDatabase = LocalDatabase();
  await localDatabase.openLocalDatabase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppProviders.appProviders,
      child: BlocBuilder<SettingsBloc, bool>(
        builder: (context, isDarkMode) {
          return MaterialApp(
            onGenerateRoute: (settings) =>
                AppRoutesGenerator.generateRoute(settings),
            title: AppStrings.appTitle,
            theme: isDarkMode
                ? AppTheme.appDarkThemeData
                : AppTheme.appLightThemeData,
            home: const ContactScreen(),
          );
        },
      ),
    );
  }
}
