import 'package:flutter/material.dart';
import 'package:mantact/app/utils/constants/app_colors.dart';
import 'package:mantact/app/utils/constants/app_strings.dart';
import 'package:mantact/app/utils/helper/app_measurement_helper.dart';
import 'package:mantact/app/utils/shared/widgets/custom_textfield.dart';
import 'package:mantact/features/contact_module/views/widgets/create_contact_dialog.dart';

class ContactHeader extends StatefulWidget {
  const ContactHeader({super.key});

  @override
  State<ContactHeader> createState() => _ContactHeaderState();
}

class _ContactHeaderState extends State<ContactHeader> {
  TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(children: [
        const Text(AppStrings.contactHeader),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.appPureWhite,
          ),
          child: Column(
            children: [
              CustomTextField(
                textFieldController: nameController,
              ),
              SizedBox(
                height: AppMeasurementHelper.calculateMeasurement(
                    context, 0.01, 'height'),
              ),
              SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                      style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return CreateContactDialog(
                              isUpdating: false,
                              name: nameController.text,
                            );
                          },
                        ).whenComplete(() {
                          nameController.clear();
                        });
                      },
                      child: const Text("Add Contact")))
            ],
          ),
        )
      ]),
    );
  }
}
