import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/models/password_database.dart';
import 'package:password_manager/models/password_model.dart';
import 'package:password_manager/screens/new_password_screen.dart';
import 'package:password_manager/screens/password_info_screen.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    readPasswords();
  }

  void readPasswords() {
    context.read<PasswordDatabase>().fetchPasswords();
  }

  @override
  Widget build(BuildContext context) {
    final passwordDatabase = context.watch<PasswordDatabase>();
    List<Password> currentPasswords = passwordDatabase.currentPasswords;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pass Vault"),
        centerTitle: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewPasswordPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: currentPasswords.length,
        itemBuilder: (context, index) {
          final password = currentPasswords[index];

          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PasswordInformationPage(password: password),
                ),
              );
            },
            leading: const Icon(Icons.check),
            title: Text(password.website),
            subtitle: Text(password.email),
          );

          //         context.read<PasswordDatabase>().deletePassword(password.id);
        },
      ),
    );
  }
}
