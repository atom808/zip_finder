import 'package:flutter/material.dart';
import 'package:zip_finder/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buscador de CEP',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomeView(),
    );
  }
}
