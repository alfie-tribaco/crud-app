import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mantact/features/settings_module/bloc/settings_events.dart';

class SettingsBloc extends Bloc<SettingsEvents, bool> {
  SettingsBloc() : super(false) {
    on<SettingsToggleDarkMode>(
      (event, emit) {
        emit(!state);
      },
    );
  }
}
