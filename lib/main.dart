import 'package:flutter/material.dart';
import 'package:token_signal_app/src/firebase.service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TokenSignal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(body: SizedBox()),
    );
  }
}
