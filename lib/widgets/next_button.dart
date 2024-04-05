import 'package:flutter/material.dart';

// Widget untuk membuat tombol berbentuk persegi panjang dengan label tertentu
class RectangularButton extends StatelessWidget {
  const RectangularButton({
    super.key,
    required this.onPressed, // Fungsi yang akan dipanggil ketika tombol ditekan
    required this.label, // Label yang akan ditampilkan pada tombol
  });

  final VoidCallback? onPressed; // Fungsi yang akan dipanggil ketika tombol ditekan
  final String label; // Label yang akan ditampilkan pada tombol

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed, // Menghubungkan fungsi onPressed dengan fungsi yang diberikan
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Card(
          color: onPressed != null ? const Color.fromRGBO(2, 19, 40, 1.0) : null, // Warna latar belakang kartu jika tombol dapat ditekan
          child: Center(
            child: Text(
              label, // Menampilkan label tombol
              style: const TextStyle(
                letterSpacing: 1,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

