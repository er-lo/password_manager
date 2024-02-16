import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:password_manager/models/password_model.dart';
import 'package:path_provider/path_provider.dart';

class PasswordDatabase extends ChangeNotifier {
  static late Isar isar;

  //init
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [PasswordSchema],
      directory: dir.path,
    );
  }

  // list of notes
  final List<Password> currentPasswords = [];

  //create
  Future<void> addPassword(String email, String userName, String password,
      String note, String website) async {
    final newPassword = Password()
      ..email = email
      ..userName = userName
      ..password = password
      ..note = note
      ..website = website;

    await isar.writeTxn(() async {
      await isar.passwords.put(newPassword);
    });

    await fetchPasswords();
  }

  //read
  Future<void> fetchPasswords() async {
    List<Password> fetchedPasswords = await isar.passwords.where().findAll();
    currentPasswords.clear();
    currentPasswords.addAll(fetchedPasswords);
    notifyListeners();
  }

  //update
  Future<void> updatePassword(int id, String email, String userName,
      String password, String note, String website) async {
    final existingPassword = await isar.passwords.get(id);
    if (existingPassword != null) {
      existingPassword.email = email;
      existingPassword.userName = userName;
      existingPassword.password = password;
      existingPassword.note = note;
      existingPassword.website = website;
      await isar.writeTxn(() => isar.passwords.put(existingPassword));
      await fetchPasswords();
    }
  }

  //delete
  Future<void> deletePassword(int id) async {
    await isar.writeTxn(() async {
      isar.passwords.delete(id);
    });
    await fetchPasswords();
  }
}
