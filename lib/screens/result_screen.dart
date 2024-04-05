import 'package:flutter/material.dart';

import '/models/questions.dart';

// Widget untuk menampilkan skor dan persentase hasil kuis
class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.score, // Skor yang diperoleh pengguna
  });

  final int score; // Skor yang diperoleh pengguna

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(width: 1000), // Untuk memberi jarak di atas teks
          const Text(
            'Your Score: ', // Teks untuk menampilkan skor
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w500,
            ),
          ),
          // Menampilkan lingkaran progres dengan nilai persentase skor
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 250,
                width: 250,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  value: score / 9, // Menghitung nilai persentase skor
                  color: Colors.green, // Warna lingkaran progres
                  backgroundColor: Colors.white, // Warna latar belakang lingkaran progres
                ),
              ),
              // Menampilkan skor dan persentase di tengah lingkaran progres
              Column(
                children: [
                  Text(
                    score.toString(), // Menampilkan skor
                    style: const TextStyle(fontSize: 80),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${(score / questions.length * 100).round()}%', // Menampilkan persentase skor
                    style: const TextStyle(fontSize: 25),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

