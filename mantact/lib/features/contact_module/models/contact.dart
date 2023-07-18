import 'package:hive/hive.dart';

part 'contact.g.dart';

@HiveType(typeId: 1)
class Contact {
  @HiveField(0)
  String name;
  @HiveField(1)
  String contactNumber;
  @HiveField(2)
  String imagePath;
  @HiveField(3)
  String email;
  @HiveField(4)
  String address;
  @HiveField(5)
  String? id;

  Contact(
      {required this.address,
      required this.contactNumber,
      required this.email,
      required this.imagePath,
      required this.name,
      this.id});
}
