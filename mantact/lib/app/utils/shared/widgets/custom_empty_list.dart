import 'package:flutter/material.dart';

class CustomEmptyListWidget extends StatefulWidget {
  const CustomEmptyListWidget({super.key});

  @override
  State<CustomEmptyListWidget> createState() => _CustomEmptyListWidgetState();
}

class _CustomEmptyListWidgetState extends State<CustomEmptyListWidget> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("No Contact Data"),
        Text("Try to Add friends on your contact list")
      ],
    );
  }
}
