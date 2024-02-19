import 'package:flutter/material.dart';
import 'package:password_manager/models/password_model.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pass Vault"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text(
              "WEBSITE / APP",
              style: TextStyle(letterSpacing: 1.1),
            ),
            SizedBox(height: 4),
            Text("hello"),
            SizedBox(height: 8),
            Divider(),
            SizedBox(height: 8),
            Text(
              "EMAIL",
              style: TextStyle(letterSpacing: 1.1),
            ),
            SizedBox(height: 4),
            Text("hello"),
            SizedBox(height: 8),
            Divider(),
            SizedBox(height: 8),
            Text(
              "USERNAME",
              style: TextStyle(letterSpacing: 1.1),
            ),
            SizedBox(height: 4),
            Text("hello"),
            SizedBox(height: 8),
            Divider(),
            SizedBox(height: 8),
            Text(
              "PASSWORD",
              style: TextStyle(letterSpacing: 1.1),
            ),
            SizedBox(height: 4),
            Text("hello"),
            SizedBox(height: 8),
            Divider(),
            SizedBox(height: 8),
            Text(
              "NOTES",
              style: TextStyle(letterSpacing: 1.1),
            ),
            SizedBox(height: 4),
            Text("hello"),
            SizedBox(height: 8),
            Divider(),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
