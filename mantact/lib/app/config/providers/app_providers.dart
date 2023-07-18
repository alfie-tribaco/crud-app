import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mantact/features/contact_module/bloc/contact_bloc.dart';
import 'package:mantact/features/settings_module/bloc/settings_bloc.dart';

class AppProviders {
  static List<BlocProvider<dynamic>> appProviders = [
    BlocProvider<ContactBloc>(create: (_) => ContactBloc()),
    BlocProvider<SettingsBloc>(create: (_) => SettingsBloc())
  ];
}
