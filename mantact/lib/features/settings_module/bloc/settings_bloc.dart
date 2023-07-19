import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mantact/app/services/cache_service/shared_preference_cache.dart';
import 'package:mantact/features/settings_module/bloc/settings_events.dart';

class SettingsBloc extends Bloc<SettingsEvents, bool> {
  final SPCache spCache;

  SettingsBloc({required this.spCache}) : super(false) {
    _initializeState();

    on<SettingsToggleDarkMode>(
      (event, emit) async {
        try {
          await spCache.setDarkModeCache(state);
          emit(!state);
        } catch (e) {
          log("Settings Bloc Exception: $e");
        }
      },
    );
  }

  Future<void> _initializeState() async {
    bool? initialDarkMode = await spCache.getDarkModeCache();
    add(SettingsToggleDarkMode(isDarkMode: initialDarkMode ?? false));
  }
}
