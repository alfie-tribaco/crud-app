import 'package:flutter/material.dart';
import 'package:mantact/app/utils/shared/widgets/custom_appbar.dart';
import 'package:mantact/features/contact_module/views/widgets/contact_header.dart';
import 'package:mantact/features/contact_module/views/widgets/contact_list.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        body: Column(
          children: [
            ContactHeader(),
            Expanded(child: ContactList()),
          ],
        ),
      ),
    );
  }
}
