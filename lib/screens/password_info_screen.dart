import 'package:flutter/material.dart';
import 'package:password_manager/models/password_model.dart';

class PasswordInformationPage extends StatefulWidget {
  const PasswordInformationPage({super.key, required this.password});

  final Password password;

  @override
  State<PasswordInformationPage> createState() =>
      _PasswordInformationPageState();
}

class _PasswordInformationPageState extends State<PasswordInformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pass Vault"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const Text("Website / App"),
            const SizedBox(height: 4),
            Text(widget.password.website),
            const SizedBox(height: 8),
            const Divider(),
            const SizedBox(height: 8),
            const Text("Email"),
            const SizedBox(height: 4),
            Text(widget.password.email),
            const SizedBox(height: 8),
            const Divider(),
            const SizedBox(height: 8),
            const Text("User Name"),
            const SizedBox(height: 4),
            Text(widget.password.userName),
            const SizedBox(height: 8),
            const Divider(),
            const SizedBox(height: 8),
            const Text("Password"),
            const SizedBox(height: 4),
            Text(widget.password.password),
            const SizedBox(height: 8),
            const Divider(),
            const SizedBox(height: 8),
            const Text("Notes"),
            const SizedBox(height: 4),
            Text(widget.password.note),
            const SizedBox(height: 8),
            const Divider(),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
