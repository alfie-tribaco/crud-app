import 'dart:developer';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:mantact/features/contact_module/models/contact.dart';
import 'package:path_provider/path_provider.dart';

class LocalDatabase {
  late BoxCollection collection;

  Future<void> openLocalDatabase() async {
    try {
      final Directory appDirectoryPath =
          await getApplicationDocumentsDirectory();

      final path = '${appDirectoryPath.path}/mantact_db';

      Hive.init(path);
      Hive.registerAdapter(ContactAdapter());

      collection = await BoxCollection.open('mantact', {'contact'}, path: path);
    } catch (e) {
      log('LocalDatabase Exception: $e');
    }
  }
}
