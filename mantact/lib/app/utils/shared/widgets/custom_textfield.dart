import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key, required this.textFieldController});

  final TextEditingController textFieldController;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textFieldController,
      decoration: const InputDecoration(border: OutlineInputBorder()),
    );
  }
}
