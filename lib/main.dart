import 'package:flutter/material.dart';
import 'views/map_home_page.dart';

void main() {
  runApp(const QuestaoMapApp());
}

class QuestaoMapApp extends StatelessWidget {
  const QuestaoMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Questão 1 - Map em Dart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MapHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}