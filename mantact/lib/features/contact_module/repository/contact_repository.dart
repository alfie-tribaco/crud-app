import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:mantact/features/contact_module/models/contact.dart';

class ContactRepository {
  Future<void> addContact(Contact contact) async {
    try {
      final box = await Hive.openBox<Contact>('contact');
      await box.put(contact.id, contact);
      await box.close();
    } catch (e) {
      log('ContactRepository Exception: $e');
    }
  }

  Future<void> deleteContact(Contact contact) async {
    try {
      final box = await Hive.openBox<Contact>('contact');
      if (box.containsKey(contact.id)) {
        await box.delete(contact.id);
      } else {
        log('oops');
      }
      await box.close();
    } catch (e) {
      log('ContactRepository Exception: $e');
    }
  }

  Future<void> updateContact(Contact contact) async {
    try {
      final box = await Hive.openBox<Contact>('contact');
      await box.put(contact.id, contact);
    } catch (e) {
      log('ContactRepository Exception: $e');
    }
  }

  Future<List<Contact>> getAllContacts() async {
    try {
      final box = await Hive.openBox<Contact>('contact');

      final contacts = box.values.toList();

      await box.close();
      return contacts;
    } catch (e) {
      log('ContactRepository Exception: $e');
      return [];
    }
  }
}
