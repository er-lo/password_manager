import 'package:flutter/material.dart';
import 'package:password_manager/models/password_model.dart';
import 'package:flutter/services.dart';

class PasswordInformationPage extends StatefulWidget {
  const PasswordInformationPage({super.key, required this.password});

  final Password password;

  @override
  State<PasswordInformationPage> createState() =>
      _PasswordInformationPageState();
}

class _PasswordInformationPageState extends State<PasswordInformationPage> {
  bool passwordIcon = false;
  bool isEditable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pass Vault"),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "EDIT",
              style: TextStyle(letterSpacing: 1.1),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            listTile("WEBSITE / APP", widget.password.website, false),
            listTile("EMAIL", widget.password.email, false),
            listTile("USERNAME", widget.password.userName, false),
            listTile("PASSWORD", widget.password.password, true),
            listTile("NOTES", widget.password.note, false),
          ],
        ),
      ),
    );
  }

  Widget listTile(String title, String subTitle, bool passwordTile) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  letterSpacing: 1.1,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              passwordTile
                  ? passwordIcon
                      ? Text(subTitle)
                      : const Text("*********")
                  : Text(subTitle)
            ],
          ),
          Row(
            children: [
              Visibility(
                visible: passwordTile,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      passwordIcon = !passwordIcon;
                    });
                  },
                  icon: passwordIcon
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                ),
              ),
              IconButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: subTitle)).then((_) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Succesfully copied to clipboard!")));
                  });
                },
                icon: const Icon(Icons.copy),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
