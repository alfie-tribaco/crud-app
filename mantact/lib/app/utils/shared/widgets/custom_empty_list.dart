import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomEmptyListWidget extends StatefulWidget {
  const CustomEmptyListWidget({super.key});

  @override
  State<CustomEmptyListWidget> createState() => _CustomEmptyListWidgetState();
}

class _CustomEmptyListWidgetState extends State<CustomEmptyListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 230,
            width: 300,
            child: LottieBuilder.asset('assets/empty_state.json')),
        Text(
          "No Contact Data",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const Text("Try to Add friends on your contact list")
      ],
    );
  }
}
