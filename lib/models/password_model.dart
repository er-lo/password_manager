import 'package:isar/isar.dart';

// needed to generate isar file
part 'password_model.g.dart';

@Collection()
class Password {
  Id id = Isar.autoIncrement;
  late String email;
  late String userName;
  late String password;
  late String note;
  late String website;
}
