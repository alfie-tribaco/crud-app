import 'package:equatable/equatable.dart';
import 'package:mantact/features/contact_module/models/contact.dart';

class ContactState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ContactStateInitial extends ContactState {
  final List<Contact> contactList;

  ContactStateInitial({required this.contactList});

  @override
  List<Object?> get props => [contactList];
}

class ContactStateLoading extends ContactState {}

class ContactStateAddSuccess extends ContactState {}

class ContactStateDeleteSuccess extends ContactState {}

class ContactStateUpdateSuccess extends ContactState {}

class ContactStateSaving extends ContactState {}

class ContactStateUpdating extends ContactState {}

class ContactStateDeleting extends ContactState {}

class ContactStateError extends ContactState {}

class ContactListLoadedSuccess extends ContactState {
  final List<Contact> listOfContact;

  ContactListLoadedSuccess({required this.listOfContact});

  @override
  List<Object?> get props => [listOfContact];
}
