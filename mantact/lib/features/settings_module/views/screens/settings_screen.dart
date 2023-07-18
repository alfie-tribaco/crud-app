import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mantact/app/utils/helper/app_measurement_helper.dart';
import 'package:mantact/features/settings_module/bloc/settings_bloc.dart';
import 'package:mantact/features/settings_module/bloc/settings_events.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      )),
                ],
              ),
              SizedBox(
                height: AppMeasurementHelper.calculateMeasurement(
                    context, 0.05, 'height'),
              ),
              Text(
                "Settings ",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(
                height: AppMeasurementHelper.calculateMeasurement(
                    context, 0.05, 'height'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("Night Mode: "),
                  BlocBuilder<SettingsBloc, bool>(
                    builder: (context, state) {
                      return Switch(
                          value: state,
                          onChanged: (value) {
                            setState(() {
                              context
                                  .read<SettingsBloc>()
                                  .add(SettingsToggleDarkMode());
                            });
                          });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
