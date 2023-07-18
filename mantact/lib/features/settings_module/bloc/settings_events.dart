import 'package:equatable/equatable.dart';

abstract class SettingsEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class SettingsToggleDarkMode extends SettingsEvents {}
