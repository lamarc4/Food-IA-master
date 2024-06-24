import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundColor: Colors.amber,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Olá, Lorem",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                "Sua meta hoje é 2000 kcal",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff909090)),
                ),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.notifications_none_sharp,
            size: 28,
          )
        ],
      ),
    );
  }
}
