import 'package:flutter/material.dart';
import 'package:my_whatsapp/pages/other/chat_screen.dart';
import 'package:my_whatsapp/pages/other/home.dart';
import 'package:my_whatsapp/pages/other/profile.dart';
import 'package:my_whatsapp/pages/tabs/calls.dart';
import 'package:my_whatsapp/pages/tabs/status.dart';
import 'package:my_whatsapp/utils/chat_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Home(),
    );
  }
}
