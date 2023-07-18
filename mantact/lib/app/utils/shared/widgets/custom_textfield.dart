import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.textFieldController,
      required this.label,
      required this.isCellNoInput,
      required this.isEmailInput,
      required this.isNameInput,
      required this.charLimit});

  final TextEditingController textFieldController;
  final String label;
  final bool isCellNoInput;
  final bool isEmailInput;
  final bool isNameInput;
  final int charLimit;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textFieldController,
      maxLength: widget.charLimit,
      keyboardType: widget.isCellNoInput == true
          ? TextInputType.number
          : widget.isEmailInput
              ? TextInputType.emailAddress
              : widget.isNameInput
                  ? TextInputType.name
                  : TextInputType.text,
      decoration: InputDecoration(
          border: const OutlineInputBorder(), label: Text(widget.label)),
    );
  }
}
