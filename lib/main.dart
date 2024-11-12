import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'About Page',
      theme: ThemeData(
        fontFamily: 'Open Sans', // Set the global font family
      ),
      home: Scaffold(
        body: Stack(
          children: [
            // Background Image
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/beach.png"), // Pastikan gambar ada di folder assets
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Bar di atas dengan judul "About"
            Positioned(
              top: 0, // Posisi bar berada di atas
              left: 0,
              right: 0,
              child: Container(
                height: 50,
                color: Colors.white, // Warna latar belakang bar
                child: Center(
                  child: Text(
                    "About", // Judul bar
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 69, 190, 246), // Warna teks hitam
                    ),
                  ),
                ),
              ),
            ),
            // Menambahkan teks Hello! di atas, dengan posisi center dan shadow
            Positioned(
              top: MediaQuery.of(context).size.height * 0.125, // Posisi dari atas 10% tinggi layar
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  "Hello World :)", // Teks yang ingin ditampilkan
                  style: TextStyle(
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                    color: Colors.white, // Warna teks putih
                    shadows: [
                      Shadow(
                        blurRadius: 10.0, // Ukuran blur shadow
                        color: Colors.black.withOpacity(0.5), // Warna shadow dengan transparansi
                        offset: Offset(2.0, 2.0), // Offset shadow
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Box with transparency, padding, and rounded corners
            const PositionedBox(),
            // Lingkaran di atas box putih
            const PositionedCircle(),
            // Info section with name, NRP, and fun fact
            const PositionedInfo(),
          ],
        ),
      ),
    );
  }
}

// Class untuk info Nama, NRP, dan Fun Fact
class PersonInfo {
  final String name;
  final String nrp;
  final List<String> funFacts; // Mengubah funFact menjadi List

  PersonInfo({required this.name, required this.nrp, required this.funFacts});
}

// Data person (Nama, NRP, dan Funfact)
final person = PersonInfo(
  name: "Anisa Rahmah",
  nrp: "5026211040",
  funFacts: [
    "Enjoy drawing and coloring, and I always feel pleased with the results.",
    "Music is something I always listen to, as I enjoy having it on at any time.",
    "I like organizing things because I feel more comfortable in a tidy space."
  ],
);

class PositionedBox extends StatelessWidget {
  const PositionedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 30), // Padding di sisi samping dan bawah
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.65, // Setengah dari layar
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.85), // Transparansi 75%
            border: Border.all(
              color: Colors.white, // Outline berwarna putih
              width: 1, // Outline tipis
            ),
            borderRadius: BorderRadius.circular(20), // Rounded corners 20 px
          ),
        ),
      ),
    );
  }
}

class PositionedCircle extends StatelessWidget {
  const PositionedCircle({super.key});

  @override
  Widget build(BuildContext context) {
    double circleDiameter = 140;
    double screenWidth = MediaQuery.of(context).size.width;

    return Positioned(
      top: MediaQuery.of(context).size.height * 0.225, // Menempatkan lingkaran tepat di atas box putih
      left: (screenWidth - circleDiameter) / 2, // Memastikan lingkaran berada di tengah secara horizontal
      child: Container(
        width: circleDiameter, // Ukuran lingkaran
        height: circleDiameter, // Ukuran lingkaran
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage("images/anisa.png"), // Gambar yang akan ditampilkan di lingkaran
            fit: BoxFit.cover,
          ),
          border: Border.all(
            color: Colors.white, // Outline putih
            width: 3, // Outline tipis
          ),
        ),
      ),
    );
  }
}

class PositionedInfo extends StatelessWidget {
  const PositionedInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.415, // Menempatkan informasi di bawah lingkaran
      left: 30, // Padding kiri
      right: 30, // Padding kanan
      child: Padding(
        padding: const EdgeInsets.all(20), // Padding luar 20px di semua sisi
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              person.name, // Mengambil nama dari variabel
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 56, 56, 56), // Warna teks menjadi hitam
              ),
            ),
            const SizedBox(height: 1),
            Text(
              "${person.nrp}", // Mengambil NRP dari variabel
              style: TextStyle(
                fontSize: 16,
                color: const Color.fromARGB(255, 52, 52, 52), // Warna teks menjadi hitam
              ),
            ),
            const SizedBox(height: 14),
            // Box untuk menampilkan fun facts beserta judulnya di dalam box
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20), // Padding 20px di semua sisi dalam box
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.85),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul Fun Facts di dalam box
                  Text(
                    "Fun Facts", // Judul untuk bagian fun facts
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: const Color.fromARGB(255, 60, 60, 60), // Warna teks judul
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Menampilkan list fun facts
                  ...List.generate(person.funFacts.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        "${index + 1}. ${person.funFacts[index]}", // Menampilkan setiap fun fact
                        style: TextStyle(
                          fontSize: 14,
                          color: const Color.fromARGB(255, 60, 60, 60), // Warna teks hitam
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
