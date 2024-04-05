import 'package:flutter/material.dart'; // Import library Flutter untuk pengembangan aplikasi mobile

import '/models/questions.dart'; // Import model pertanyaan
import '/screens/result_screen.dart'; // Import layar hasil quiz
import '/widgets/answer_card.dart'; // Import widget kartu jawaban
import '/widgets/next_button.dart'; // Import widget tombol "Berikutnya"

class QuizScreen extends StatefulWidget { // Kelas QuizScreen merupakan StatefulWidget yang berfungsi untuk menampilkan dan mengelola kuis
  const QuizScreen({Key? key}) : super(key: key); // Konstruktor QuizScreen

  @override
  State<QuizScreen> createState() => _QuizScreenState(); // Membuat state untuk QuizScreen
}

class _QuizScreenState extends State<QuizScreen> { // Kelas _QuizScreenState merupakan State dari QuizScreen
  int? selectedAnswerIndex; // Index jawaban yang dipilih oleh pengguna
  int questionIndex = 0; // Index pertanyaan yang sedang ditampilkan
  int score = 0; // Skor yang telah didapatkan oleh pengguna

  void pickAnswer(int value) { // Metode untuk menangani pemilihan jawaban oleh pengguna
    selectedAnswerIndex = value; // Menetapkan index jawaban yang dipilih
    final question = questions[questionIndex]; // Mengambil pertanyaan saat ini dari daftar pertanyaan
    if (selectedAnswerIndex == question.correctAnswerIndex) { // Jika jawaban yang dipilih benar
      score++; // Menambah skor
    }
    setState(() {}); // Memperbarui tampilan
  }

  void goToNextQuestion() { // Metode untuk beralih ke pertanyaan berikutnya
    if (questionIndex < questions.length - 1) { // Jika belum mencapai pertanyaan terakhir
      questionIndex++; // Pindah ke pertanyaan berikutnya
      selectedAnswerIndex = null; // Mengatur index jawaban yang dipilih menjadi null
    }
    setState(() {}); // Memperbarui tampilan
  }

  @override
  Widget build(BuildContext context) { // Metode build untuk mengatur tata letak dan tampilan kuis
    final question = questions[questionIndex]; // Mengambil pertanyaan saat ini dari daftar pertanyaan
    bool isLastQuestion = questionIndex == questions.length - 1; // Menentukan apakah ini adalah pertanyaan terakhir

    return Scaffold( // Mengatur tampilan dasar aplikasi
      appBar: AppBar( // Membuat AppBar
        title: const Text( // Menampilkan judul AppBar
          'Quiz - About Vokasi', // Judul AppBar
          style: TextStyle( // Gaya teks untuk judul AppBar
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromRGBO(2, 19, 40, 1.0), // Warna latar belakang AppBar
      ),
      body: Stack( // Menata konten aplikasi menggunakan Stack
        children: [
          Positioned.fill( // Menempatkan konten di lapisan atas
            child: Container( // Membuat kontainer untuk konten
              decoration: const BoxDecoration( // Mendekorasi kontainer dengan border radius
                color: Colors.white, // Warna latar belakang kontainer
                borderRadius: BorderRadius.only( // Membuat border radius hanya di bagian atas
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              margin: EdgeInsets.only(top: 200), // Memberikan margin untuk konten di bawah gambar
            ),
          ),
          Padding( // Memberikan padding untuk konten di dalam Stack
            padding: const EdgeInsets.all(20.0),
            child: Column( // Menata konten dalam bentuk kolom
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Menyusun konten secara merata
              children: [
                Container( // Kontainer untuk gambar pertanyaan
                  decoration: BoxDecoration( // Mendekorasi kontainer dengan border
                    borderRadius: BorderRadius.circular(16.0), // Border radius untuk kontainer
                    border: Border.all( // Border dengan warna dan lebar tertentu
                      color: Colors.blueGrey, // Warna border
                      width: 7.0, // Lebar border
                    ),
                  ),
                  child: ClipRRect( // Menggunakan ClipRRect untuk memotong gambar sesuai border radius
                    borderRadius: BorderRadius.circular(8.0), // Border radius untuk gambar
                    child: Image.asset( // Menampilkan gambar pertanyaan
                      question.imageUrl, // Path gambar dari pertanyaan
                      height: 200, // Tinggi gambar
                      width: 200, // Lebar gambar
                      fit: BoxFit.cover, // Menyesuaikan gambar dengan kontainer
                    ),
                  ),
                ),
                Text( // Menampilkan teks pertanyaan
                  question.question, // Teks pertanyaan
                  style: const TextStyle( // Gaya teks untuk pertanyaan
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center, // Posisi teks pertanyaan
                ),
                ListView.builder( // Membangun daftar jawaban
                  shrinkWrap: true, // Merapikan daftar jawaban
                  itemCount: question.options.length, // Jumlah opsi jawaban
                  itemBuilder: (context, index) { // Membangun setiap item daftar jawaban
                    return GestureDetector( // Menambahkan Gesture Detector untuk menangani interaksi dengan jawaban
                      onTap: selectedAnswerIndex == null // Mengatur fungsi ketika jawaban dipilih
                          ? () => pickAnswer(index) // Memanggil metode pickAnswer jika jawaban belum dipilih
                          : null, // Mengatur nilai null jika jawaban sudah dipilih
                      child: AnswerCard( // Menampilkan kartu jawaban
                        currentIndex: index, // Index jawaban saat ini
                        question: question.options[index], // Teks jawaban
                        isSelected: selectedAnswerIndex == index, // Menentukan apakah jawaban dipilih
                        selectedAnswerIndex: selectedAnswerIndex, // Menyimpan index jawaban yang dipilih
                        correctAnswerIndex: question.correctAnswerIndex, // Menyimpan index jawaban yang benar
                      ),
                    );
                  },
                ),
                isLastQuestion // Menampilkan tombol "Finish" jika ini adalah pertanyaan terakhir
                    ? RectangularButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => ResultScreen(
                          score: score, // Mengirim skor ke layar hasil quiz
                        ),
                      ),
                    );
                  },
                  label: 'Finish', // Label tombol "Finish"
                )
                    : RectangularButton(
                  onPressed: selectedAnswerIndex != null // Menampilkan tombol "Berikutnya" jika jawaban telah dipilih
                      ? goToNextQuestion // Memanggil metode goToNextQuestion jika jawaban telah dipilih
                      : null, // Mengatur nilai null jika jawaban belum dipilih
                  label: 'Berikutnya', // Label tombol "Berikutnya"
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
