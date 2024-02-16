import 'package:flutter/material.dart';
import 'package:password_manager/models/password_database.dart';
import 'package:password_manager/models/password_model.dart';
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

  //text controller
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final noteController = TextEditingController();
  final websiteController = TextEditingController();

  void createPassword() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          children: [
            TextField(
              controller: emailController,
            ),
            TextField(
              controller: userNameController,
            ),
            TextField(
              controller: passwordController,
            ),
            TextField(
              controller: noteController,
            ),
            TextField(
              controller: websiteController,
            ),
          ],
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              context.read<PasswordDatabase>().addPassword(
                  emailController.text,
                  userNameController.text,
                  passwordController.text,
                  noteController.text,
                  websiteController.text);

              emailController.clear();
              userNameController.clear();
              passwordController.clear();
              noteController.clear();
              websiteController.clear();
              Navigator.pop(context);
            },
            child: const Text("Create"),
          ),
        ],
      ),
    );
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createPassword,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: currentPasswords.length,
        itemBuilder: (context, index) {
          final password = currentPasswords[index];

          return ListTile(
            title: Text(password.email),
            trailing: IconButton(
                onPressed: () {
                  context.read<PasswordDatabase>().deletePassword(password.id);
                },
                icon: const Icon(Icons.delete)),
          );
        },
      ),
    );
  }
}
