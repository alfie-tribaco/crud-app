import 'dart:developer';
import 'dart:io';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:mantact/app/utils/constants/app_colors.dart';
import 'package:mantact/features/contact_module/bloc/contact_bloc.dart';
import 'package:mantact/features/contact_module/bloc/contact_events.dart';
import 'package:mantact/features/contact_module/models/contact.dart';
import 'package:mantact/features/contact_module/views/widgets/create_contact_dialog.dart';

class ContactCard extends StatefulWidget {
  const ContactCard(
      {super.key,
      required this.cpNo,
      required this.imagePath,
      required this.name,
      required this.address,
      required this.email,
      required this.id});
  final String? id;
  final String name;
  final String email;
  final String cpNo;
  final String address;
  final String imagePath;

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  final GlobalKey<ExpansionTileCardState> contactTileKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Slidable(
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            backgroundColor: AppColors.appRed,
            onPressed: (context) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Are you sure?"),
                    content: const Text(
                        "This will delete the contact and you cannot bring it back anymore"),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel")),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.appRed,
                          ),
                          onPressed: () {
                            context.read<ContactBloc>().add(ContactDelete(
                                contact: Contact(
                                    id: widget.id,
                                    address: widget.address,
                                    contactNumber: widget.cpNo,
                                    email: widget.email,
                                    imagePath: widget.imagePath,
                                    name: widget.name)));
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Delete",
                            style: TextStyle(color: AppColors.appPureWhite),
                          )),
                    ],
                  );
                },
              );
            },
            label: "Delete",
          ),
          SlidableAction(
            backgroundColor: AppColors.primaryColor,
            onPressed: (context) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return CreateContactDialog(
                      name: widget.name,
                      isUpdating: true,
                      contact: Contact(
                          id: widget.id,
                          address: widget.address,
                          contactNumber: widget.cpNo,
                          email: widget.email,
                          imagePath: widget.imagePath,
                          name: widget.name),
                    );
                  });
            },
            label: "Edit",
          )
        ]),
        child: ExpansionTile(
          key: contactTileKey,
          leading: CircleAvatar(
            backgroundImage: FileImage(File(widget.imagePath.toString())),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 140,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      widget.cpNo,
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      await FlutterPhoneDirectCaller.callNumber(widget.cpNo);
                    } catch (e) {
                      log('Call Exception:  $e');
                    }
                  },
                  child: const Text("Call"))
            ],
          ),
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Email:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(widget.email),
                  const Divider(),
                  const Text(
                    "Address:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(widget.address),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
