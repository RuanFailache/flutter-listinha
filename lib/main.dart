import 'package:flutter/material.dart';
import 'package:listinha/factories/home/home_presentation_factory.dart';

void main() {
  runApp(const ListinhaApp());
}

class ListinhaApp extends StatelessWidget {
  const ListinhaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Listinha',
      initialRoute: '/',
      routes: {
        '/': makeHomeApplication,
      },
    );
  }
}
