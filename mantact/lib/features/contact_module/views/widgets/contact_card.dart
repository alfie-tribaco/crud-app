import 'dart:io';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mantact/app/utils/constants/app_colors.dart';
import 'package:mantact/app/utils/helper/app_measurement_helper.dart';
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
              context.read<ContactBloc>().add(ContactDelete(
                  contact: Contact(
                      id: widget.id,
                      address: widget.address,
                      contactNumber: widget.cpNo,
                      email: widget.email,
                      imagePath: widget.imagePath,
                      name: widget.name)));
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
                    ),
                    Text(widget.cpNo)
                  ],
                ),
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Call"))
            ],
          ),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Email:"),
                Text(widget.email),
                SizedBox(
                  height: AppMeasurementHelper.calculateMeasurement(
                      context, 0.01, 'height'),
                ),
                const Text("Address:"),
                Text(widget.address),
                SizedBox(
                  height: AppMeasurementHelper.calculateMeasurement(
                      context, 0.01, 'height'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
