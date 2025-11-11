import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const RencanaPembelajaranApp());
}

class RencanaPembelajaranApp extends StatelessWidget {
  const RencanaPembelajaranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rencana Pembelajaran Mendalam',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 2,
        ),
      ),
      home: const HomeScreen(),
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}