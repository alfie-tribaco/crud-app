import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mantact/features/contact_module/bloc/contact_bloc.dart';

class AppProviders {
  static List<BlocProvider<ContactBloc>> appProviders = [
    BlocProvider<ContactBloc>(create: (_) => ContactBloc())
  ];
}
