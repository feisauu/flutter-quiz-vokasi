import 'package:flutter/material.dart';

import '/screens/quiz_screen.dart';

void main() {
  runApp(const MainApp());
}

// Aplikasi utama yang mengatur tema dan widget utama
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'About Vokasi', // Ubah judul aplikasi di sini
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug di sudut kanan atas
      themeMode: ThemeMode.dark, // Mengatur mode tema menjadi tema gelap
      theme: ThemeData.dark().copyWith(
        // Mengatur tema gelap dengan latar belakang warna RGB(2, 19, 40)
        scaffoldBackgroundColor: Color.fromRGBO(3, 30, 61, 1.0), // Ubah nilai RGB sesuai keinginan
      ),
      home: const QuizScreen(), // Menentukan widget utama aplikasi
    );
  }
}
