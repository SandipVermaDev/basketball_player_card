import 'package:flutter/material.dart';
import 'player_card_screen.dart';
import 'mock_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Basketball Player Cards',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PlayerCardScreen(players: players),
    );
  }
}
