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

  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pass Vault"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: websiteController,
                  decoration: const InputDecoration(
                    label: Text(
                      "WEBSITE / APP",
                      style: TextStyle(letterSpacing: 1.1),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    label: Text(
                      "EMAIL",
                      style: TextStyle(letterSpacing: 1.1),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: userNameController,
                  decoration: const InputDecoration(
                    label: Text(
                      "USERNAME",
                      style: TextStyle(letterSpacing: 1.1),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: passwordController,
                  obscureText: passwordVisible,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    label: const Text(
                      "PASSWORD",
                      style: TextStyle(letterSpacing: 1.1),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: noteController,
                  decoration: const InputDecoration(
                    label: Text(
                      "NOTES",
                      style: TextStyle(letterSpacing: 1.1),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              OutlinedButton(
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
                child: const Text("SAVE"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
