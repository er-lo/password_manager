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
        actions: [TextButton(onPressed: (){}, child: const Text("EDIT", style: TextStyle(letterSpacing: 1.1),),),],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: const Text(
                "WEBSITE / APP",
                style: TextStyle(letterSpacing: 1.1),
              ),
              subtitle: Text(widget.password.website),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.copy),),
            ),
          ListTile(
              title: const Text(
                "EMAIL",
                style: TextStyle(letterSpacing: 1.1),
              ),
              subtitle: Text(widget.password.email),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.copy),
              ),
            ),
            ListTile(
              title: const Text(
                "USERNAME",
                style: TextStyle(letterSpacing: 1.1),
              ),
              subtitle: Text(widget.password.userName),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.copy),
              ),
            ),
            ListTile(
              title: const Text(
                "PASSWORD",
                style: TextStyle(letterSpacing: 1.1),
              ),
              subtitle: Text(widget.password.password),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.copy),
              ),
            ),
            ListTile(
              title: const Text(
                "NOTES",
                style: TextStyle(letterSpacing: 1.1),
              ),
              subtitle: Text(widget.password.note),
            ),
          ],
        ),
      ),
    );
  }
}
