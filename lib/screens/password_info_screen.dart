import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:password_manager/models/password_database.dart';
import 'package:password_manager/models/password_model.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              listTile("WEBSITE / APP", widget.password.website, false, true),
              listTile("EMAIL", widget.password.email, false, true),
              listTile("USERNAME", widget.password.userName, false, true),
              listTile("PASSWORD", widget.password.password, true, true),
              listTile("NOTES", widget.password.note, false, false),
              OutlinedButton(
                onPressed: () {
                  context
                      .read<PasswordDatabase>()
                      .deletePassword(widget.password.id);
                  Navigator.pop(context);
                },
                child: const Text("DELETE"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listTile(
      String title, String subTitle, bool passwordTile, bool copyTile) {
    var deviceSize = MediaQuery.of(context).size;
    var width = deviceSize.width;
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
              LimitedBox(
                maxWidth: width / 1.3,
                child: passwordTile
                    ? passwordIcon
                        ? Text(subTitle)
                        : const Text("*********")
                    : Text(subTitle),
              )
            ],
          ),
          Visibility(
            visible: copyTile,
            child: Row(
              children: [
                Visibility(
                  visible: passwordTile,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        passwordIcon = !passwordIcon;
                      });
                    },
                    icon: Icon(
                        passwordIcon ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: subTitle)).then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Succesfully copied to clipboard!"),
                        ),
                      );
                    });
                  },
                  icon: const Icon(Icons.copy),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
