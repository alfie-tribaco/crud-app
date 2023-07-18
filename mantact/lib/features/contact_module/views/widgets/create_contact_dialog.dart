import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mantact/app/utils/helper/app_measurement_helper.dart';
import 'package:mantact/app/utils/helper/image_picker_helper.dart';
import 'package:mantact/app/utils/shared/widgets/custom_textfield.dart';
import 'package:mantact/features/contact_module/bloc/contact_bloc.dart';
import 'package:mantact/features/contact_module/bloc/contact_events.dart';
import 'package:mantact/features/contact_module/models/contact.dart';

class CreateContactDialog extends StatefulWidget {
  const CreateContactDialog(
      {super.key, required this.name, required this.isUpdating, this.contact});

  final String name;
  final bool isUpdating;
  final Contact? contact;

  @override
  State<CreateContactDialog> createState() => _CreateContactDialogState();
}

class _CreateContactDialogState extends State<CreateContactDialog> {
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String? imagePath;

  @override
  void initState() {
    checkIfUpdating(widget.isUpdating);
    super.initState();
  }

  @override
  void dispose() {
    numberController.dispose();
    addressController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void checkIfUpdating(isUpdating) {
    if (isUpdating == true) {
      numberController.text = widget.contact!.contactNumber;
      addressController.text = widget.contact!.address;
      emailController.text = widget.contact!.email;
      imagePath = widget.contact!.imagePath;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          Text(widget.name),
          SizedBox(
            height: AppMeasurementHelper.calculateMeasurement(
                context, 0.02, 'height'),
          ),
          GestureDetector(
              onTap: () {
                ImagePickerHelper().pickImage().then((value) async {
                  setState(() {
                    imagePath = value;
                  });
                });
              },
              child: SizedBox(
                  height: 80,
                  width: 80,
                  child: CircleAvatar(
                    radius: 50, // Adjust the radius as per your requirement
                    backgroundImage:
                        imagePath != null ? FileImage(File(imagePath!)) : null,
                  ))),
          SizedBox(
            height: AppMeasurementHelper.calculateMeasurement(
                context, 0.02, 'height'),
          ),
          CustomTextField(
            textFieldController: numberController,
          ),
          SizedBox(
            height: AppMeasurementHelper.calculateMeasurement(
                context, 0.02, 'height'),
          ),
          CustomTextField(
            textFieldController: emailController,
          ),
          SizedBox(
            height: AppMeasurementHelper.calculateMeasurement(
                context, 0.02, 'height'),
          ),
          CustomTextField(
            textFieldController: addressController,
          ),
          SizedBox(
            height: AppMeasurementHelper.calculateMeasurement(
                context, 0.02, 'height'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              FilledButton(
                  onPressed: () {
                    if (widget.isUpdating == false) {
                      if (addressController.text == "" ||
                          numberController.text == "" ||
                          emailController.text == "") {
                        Fluttertoast.showToast(msg: "Complete Fields");
                      } else {
                        context.read<ContactBloc>().add(ContactAdd(
                            contact: Contact(
                                id: UniqueKey().toString(),
                                address: addressController.text,
                                contactNumber: numberController.text,
                                email: emailController.text,
                                imagePath: imagePath.toString(),
                                name: widget.name)));
                        Navigator.pop(context);
                      }
                    } else {
                      if (addressController.text == "" ||
                          numberController.text == "" ||
                          emailController.text == "") {
                        Fluttertoast.showToast(msg: "Complete Fields");
                      } else {
                        context.read<ContactBloc>().add(ContactUpdate(
                            contact: Contact(
                                id: widget.contact!.id,
                                address: addressController.text,
                                contactNumber: numberController.text,
                                email: emailController.text,
                                imagePath: imagePath.toString(),
                                name: widget.name)));
                        Navigator.pop(context);
                      }
                    }
                  },
                  child: Text(widget.isUpdating == false
                      ? "Save Contact"
                      : "Update Contact"))
            ],
          )
        ]),
      )),
    );
  }
}
