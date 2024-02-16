import 'package:flutter/material.dart';
import 'package:password_manager/models/password_database.dart';
import 'package:password_manager/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  //initialize isar database
  WidgetsFlutterBinding.ensureInitialized();
  await PasswordDatabase.initialize();

  runApp(ChangeNotifierProvider(
    create: (context) => PasswordDatabase(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
