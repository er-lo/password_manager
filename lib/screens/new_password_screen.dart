import 'package:flutter/material.dart';
import 'package:password_manager/models/password_database.dart';
import 'package:provider/provider.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {

  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final noteController = TextEditingController();
  final websiteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pass Vault"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const SizedBox(height: 8),
            const Text(
              "WEBSITE / APP",
              style: TextStyle(letterSpacing: 1.1),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: websiteController,
            ),
            const SizedBox(height: 8),
            const SizedBox(height: 8),
            const Text(
              "EMAIL",
              style: TextStyle(letterSpacing: 1.1),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: emailController,
            ),
            const SizedBox(height: 8),
            const SizedBox(height: 8),
            const Text(
              "USERNAME",
              style: TextStyle(letterSpacing: 1.1),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: userNameController,
            ),
            const SizedBox(height: 8),
            const SizedBox(height: 8),
            const Text(
              "PASSWORD",
              style: TextStyle(letterSpacing: 1.1),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 8),
            const SizedBox(height: 8),
            const Text(
              "NOTES",
              style: TextStyle(letterSpacing: 1.1),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: noteController,
            ),
            const SizedBox(height: 8),
            const SizedBox(height: 24),
            OutlinedButton(onPressed: (){
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
            }, child: Text("hello"),),
          ],
        ),
      ),
    );
  }
}
