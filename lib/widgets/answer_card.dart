import 'package:flutter/material.dart'; // Import library Flutter untuk pengembangan aplikasi mobile

class AnswerCard extends StatelessWidget { // Kelas AnswerCard merupakan StatelessWidget untuk menampilkan jawaban
  const AnswerCard({ // Konstruktor AnswerCard
    Key? key,
    required this.question, // Pertanyaan yang akan ditampilkan
    required this.isSelected, // Menyimpan informasi apakah jawaban dipilih
    required this.currentIndex, // Index jawaban saat ini
    required this.correctAnswerIndex, // Index jawaban yang benar
    required this.selectedAnswerIndex, // Index jawaban yang dipilih
  }) : super(key: key);

  final String question; // Pertanyaan yang akan ditampilkan
  final bool isSelected; // Menyimpan informasi apakah jawaban dipilih
  final int? correctAnswerIndex; // Index jawaban yang benar
  final int? selectedAnswerIndex; // Index jawaban yang dipilih
  final int currentIndex; // Index jawaban saat ini

  @override
  Widget build(BuildContext context) { // Metode build untuk menampilkan konten jawaban
    bool isCorrectAnswer = currentIndex == correctAnswerIndex; // Menyimpan informasi apakah jawaban saat ini benar
    bool isWrongAnswer = !isCorrectAnswer && isSelected; // Menyimpan informasi apakah jawaban saat ini salah

    return Padding( // Memberikan padding pada konten jawaban
      padding: const EdgeInsets.symmetric( // Padding vertikal pada konten jawaban
        vertical: 10.0,
      ),
      child: selectedAnswerIndex != null // Menampilkan kontainer jawaban jika jawaban dipilih
          ? Container( // Kontainer untuk jawaban yang dipilih
        height: 55, // Tinggi kontainer
        padding: const EdgeInsets.all(15.0), // Padding pada kontainer
        decoration: BoxDecoration( // Mendekorasi kontainer dengan border
          color: Colors.white, // Warna latar belakang kontainer
          borderRadius: BorderRadius.circular(10), // Border radius untuk kontainer
          border: Border.all( // Border dengan warna dan lebar tertentu
            color: isCorrectAnswer // Warna border berbeda tergantung pada jawaban benar/salah
                ? Colors.green // Warna border jika jawaban benar
                : isWrongAnswer
                ? Colors.red // Warna border jika jawaban salah
                : Colors.grey, // Warna border default
            width: 1.0, // Ketebalan garis
          ),
        ),
        child: Row( // Menampilkan teks jawaban dan ikon jawaban benar/salah
          children: [
            Expanded( // Widget Expanded untuk memungkinkan teks jawaban mengisi sebagian besar ruang
              child: Text( // Menampilkan teks pertanyaan
                question, // Teks pertanyaan
                style: const TextStyle( // Gaya teks untuk pertanyaan
                  fontSize: 14,
                  color: Color.fromRGBO(2, 19, 40, 1.0),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(width: 10), // Spasi horizontal antara teks jawaban dan ikon jawaban benar/salah
            isCorrectAnswer // Menampilkan ikon jawaban benar jika jawaban benar
                ? const CircleAvatar( // Menampilkan ikon tanda centang jika jawaban benar
              radius: 15,
              backgroundColor: Colors.green,
              child: Icon(
                Icons.check,
                color: Colors.white,
              ),
            )
                : isWrongAnswer // Menampilkan ikon jawaban salah jika jawaban salah
                ? const CircleAvatar( // Menampilkan ikon silang jika jawaban salah
              radius: 15,
              backgroundColor: Colors.red,
              child: Icon(
                Icons.close,
                color: Colors.white,
              ),
            )
                : const SizedBox.shrink(), // Jika tidak ada jawaban yang dipilih, tidak menampilkan ikon
          ],
        ),
      )
          : Container( // Kontainer untuk jawaban yang belum dipilih
        height: 55, // Tinggi kontainer
        padding: const EdgeInsets.all(15.0), // Padding pada kontainer
        decoration: BoxDecoration( // Mendekorasi kontainer dengan border
          color: Colors.white, // Warna latar belakang kontainer
          borderRadius: BorderRadius.circular(10), // Border radius untuk kontainer
          border: Border.all( // Border dengan warna dan lebar tertentu
            color: Colors.grey, // Warna border default
          ),
        ),
        child: Row( // Menampilkan teks jawaban
          children: [
            Expanded( // Widget Expanded untuk memungkinkan teks jawaban mengisi sebagian besar ruang
              child: Text( // Menampilkan teks pertanyaan
                question, // Teks pertanyaan
                style: const TextStyle( // Gaya teks untuk pertanyaan
                  fontSize: 14,
                  color: Color.fromRGBO(2, 19, 40, 1.0),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk menampilkan ikon tanda centang jika jawaban benar
  Widget buildCorrectIcon() => const CircleAvatar(
    radius: 15,
    backgroundColor: Colors.green,
    child: Icon(
      Icons.check,
      color: Colors.white,
    ),
  );

  // Widget untuk menampilkan ikon silang jika jawaban salah
  Widget buildWrongIcon() => const CircleAvatar(
    radius: 15,
    backgroundColor: Colors.red,
    child: Icon(
      Icons.close,
      color: Colors.white,
    ),
  );
}
