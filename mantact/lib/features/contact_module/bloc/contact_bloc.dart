import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mantact/features/contact_module/bloc/contact_events.dart';
import 'package:mantact/features/contact_module/bloc/contact_state.dart';
import 'package:mantact/features/contact_module/models/contact.dart';
import 'package:mantact/features/contact_module/repository/contact_repository.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactStateInitial(contactList: const [])) {
    final ContactRepository repo = ContactRepository();
    on<ContactAdd>((event, emit) async {
      try {
        emit(ContactStateSaving());
        await repo.addContact(event.contact);
        emit(ContactStateAddSuccess());
        add(ContactGetAll());
      } catch (e) {
        emit(ContactStateError());
        log("ContactBloc Exception: $e");
      }
    });
    on<ContactDelete>((event, emit) async {
      try {
        emit(ContactStateDeleting());
        await repo.deleteContact(event.contact);
        emit(ContactStateDeleteSuccess());
        add(ContactGetAll());
      } catch (e) {
        emit(ContactStateError());
        log("ContactBloc Exception: $e");
      }
    });
    on<ContactUpdate>((event, emit) async {
      try {
        emit(ContactStateUpdating());
        await repo.updateContact(event.contact);
        emit(ContactStateUpdateSuccess());
        add(ContactGetAll());
      } catch (e) {
        emit(ContactStateError());
        log("ContactBloc Exception: $e");
      }
    });

    on<ContactGetAll>((event, emit) async {
      try {
        emit(ContactStateLoading());
        List<Contact> listOfContacts = await repo.getAllContacts();
        emit(ContactListLoadedSuccess(listOfContact: listOfContacts));
      } catch (e) {
        emit(ContactStateError());
        log("ContactBloc Exception: $e");
      }
    });
  }
}
