import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mantact/app/utils/shared/widgets/custom_empty_list.dart';
import 'package:mantact/features/contact_module/bloc/contact_bloc.dart';
import 'package:mantact/features/contact_module/bloc/contact_events.dart';
import 'package:mantact/features/contact_module/bloc/contact_state.dart';
import 'package:mantact/features/contact_module/views/widgets/contact_card.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  void initState() {
    final ContactBloc contactBloc = BlocProvider.of<ContactBloc>(context);
    contactBloc.add(ContactGetAll());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      color: Theme.of(context).colorScheme.background,
      child: BlocConsumer<ContactBloc, ContactState>(
        listener: (context, state) {
          if (state is ContactStateDeleteSuccess) {
            Fluttertoast.showToast(msg: "Delete success");
          } else if (state is ContactStateAddSuccess) {
            Fluttertoast.showToast(msg: "Added success");
          }
        },
        builder: (context, state) {
          if (state is ContactListLoadedSuccess) {
            var listOfContacts = state.listOfContact;
            if (listOfContacts.isEmpty) {
              return const SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomEmptyListWidget(),
                    ],
                  ));
            } else {
              return ListView.builder(
                itemCount: listOfContacts.length,
                itemBuilder: (context, index) {
                  return ContactCard(
                    id: listOfContacts[index].id,
                    name: listOfContacts[index].name,
                    cpNo: listOfContacts[index].contactNumber,
                    imagePath: listOfContacts[index].imagePath,
                    address: listOfContacts[index].address,
                    email: listOfContacts[index].email,
                  );
                },
              );
            }
          } else if (state is ContactStateLoading ||
              state is ContactStateDeleting ||
              state is ContactStateSaving ||
              state is ContactStateUpdating) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ContactStateError) {
            return const Text("Something went Wrong");
          } else {
            return const SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomEmptyListWidget(),
                  ],
                ));
          }
        },
      ),
    );
  }
}
