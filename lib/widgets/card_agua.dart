import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardAgua extends StatelessWidget {
  final String quantidadeAgua;
  final String horaTomada;

  const CardAgua({
    super.key,
    required this.quantidadeAgua,
    required this.horaTomada,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: const BoxDecoration(
        color: Color(0xffD5E7F4),
        borderRadius: BorderRadius.all(Radius.circular(11)),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xff72AED9)),
            child: const Center(
              child: Icon(
                Icons.water_drop,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Âgua",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff282828)),
                ),
              ),
              Text(
                quantidadeAgua,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff909090)),
                ),
              ),
            ],
          ),
          const Spacer(),
          Align(
            alignment: Alignment.topRight,
            child: Text(
              horaTomada,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff909090)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
