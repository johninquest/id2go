import 'package:isar/isar.dart';

// part 'contact.g.dart';

@collection
class IdDescriptor {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment
  late String idCategory;
  late String idType;
  late int idNumber;
  late int validFrom;
  late int validTo;
  late int idComment;
}

/* import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class User {
  User(
      {required this.firstName,
      required this.lastName,
      required this.dateOfBirth});

  @HiveField(0)
  String firstName;

  @HiveField(1)
  String lastName;

  @HiveField(2)
  String dateOfBirth;

  @override
  String toString() {
    return '$firstName, $lastName, $dateOfBirth';
  }
}

@HiveType(typeId: 1)
class IdRecord {
  IdRecord(
      {required this.idType,
      required this.idName,
      required this.idNumber,
      required this.idValidFrom,
      required this.idValidTo,
      required this.idComment});

  @HiveField(0)
  String idType;

  @HiveField(1)
  String idName;

  @HiveField(2)
  String idNumber;

  @HiveField(3)
  String idValidFrom;

  @HiveField(4)
  String idValidTo;

  @HiveField(5)
  String idComment;

  @override
  String toString() {
    return '$idType, $idName, $idNumber, $idValidFrom, $idValidTo, $idComment';
  }
}
 */
