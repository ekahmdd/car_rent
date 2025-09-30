import 'package:car_rent/screens/car_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarItem extends StatelessWidget {
  final String brand;
  final String name;
  final String price;
  final String assetPath;

  const CarItem({
    super.key,
    required this.brand,
    required this.name,
    required this.price,
    required this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Data tiap mobil
        String description;
        List<Color> colors;
        List<String> features;

        if (name == "Toyota Prado") {
          description =
              "Land Cruiser Prado adalah kendaraan yang menyajikan gabungan langka antara kemewahan kelas atas dan ketangguhan legendaris, menjadikannya pilihan utama di aplikasi rental kami. Mobil ini ideal untuk segala kebutuhan, mulai dari menjemput kolega penting hingga membawa keluarga besar berlibur panjang. Anda akan disambut oleh kabin yang sangat lapang yang mampu menampung hingga tujuh penumpang dengan kenyamanan maksimal, ditunjang oleh material premium dan fitur-fitur modern seperti sistem infotainment canggih. ";
          colors = [Colors.white, Colors.black, Colors.grey];
          features = ["AC", "Sound System", "GPS", "Airbag"];
        } else if (name == "Honda Civic") {
          description =
              "Honda Civic menawarkan performa sporty dengan desain aerodinamis serta kenyamanan berkendara kelas atas.";
          colors = [Colors.red, Colors.black];
          features = ["AC", "Bluetooth", "Cruise Control", "ABS"];
        } else if (name == "Suzuki Swift") {
          description =
              "Suzuki Swift adalah hatchback kompak dengan handling lincah dan hemat bahan bakar.";
          colors = [Colors.white, Colors.blueAccent];
          features = ["AC", "Sound System", "USB Charger"];
        } else {
          description =
              "Mercedes-Benz Luxury memberikan pengalaman berkendara mewah dengan teknologi canggih.";
          colors = [Colors.grey.shade600, Colors.black];
          features = ["AC", "Premium Sound", "GPS", "Heated Seats"];
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailCarPage(
              brand: brand,
              name: name,
              price: price,
              assetPath: assetPath,
              description: description,
              colors: colors,
              features: features,
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 160,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2E2C4D), Color(0xFF3B487E)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 18,
                        color: Color(0xFF2E2C4D),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      brand,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                      ),
                    ),
                    Text(
                      name,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              // Harga
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xff3A4879),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Text(
                        price,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "/ Hari",
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Gambar mobil
              Align(
                alignment: Alignment.bottomRight,
                child: Transform.translate(
                  offset: const Offset(30, 10),
                  child: Image.asset(
                    assetPath,
                    height: 160,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
