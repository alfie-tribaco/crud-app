import 'package:equatable/equatable.dart';
import 'package:mantact/features/contact_module/models/contact.dart';

abstract class ContactEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ContactAdd extends ContactEvent {
  final Contact contact;
  ContactAdd({required this.contact});
}

final class ContactDelete extends ContactEvent {
  final Contact contact;
  ContactDelete({required this.contact});
}

final class ContactGetAll extends ContactEvent {}

final class ContactUpdate extends ContactEvent {
  final Contact contact;
  ContactUpdate({required this.contact});
}
