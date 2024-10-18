import 'package:hive/hive.dart';
part 'languages.g.dart';

@HiveType(typeId: 8)
class LanguagesPresent extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final Languages language;
  LanguagesPresent({required this.id, required this.language});
}

@HiveType(typeId: 9)
enum Languages {
  @HiveField(0)
  ENGLISH("English"),
  @HiveField(1)
  FRANCH("Franch"),
  @HiveField(2)
  GERMAN("German"),
  @HiveField(3)
  UKRANIAN("Ukranian"),
  @HiveField(4)
  UNDEFINED("Undefined");

  final String title;
  const Languages(this.title);
}
