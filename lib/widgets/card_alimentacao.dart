import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardAlimentacao extends StatelessWidget {
  final String titulo;
  final String calorias;
  // final Image imagem;
  final Function()? onTap;

  const CardAlimentacao({
    super.key,
    required this.titulo,
    required this.calorias,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 80,
      decoration: const BoxDecoration(
        color: Color(0xffEFEFEF),
        borderRadius: BorderRadius.all(Radius.circular(11)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Image.asset(
              "assets/camera.jpg",
              cacheWidth: 48,
              cacheHeight: 48,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff282828),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.whatshot, size: 16, color: Colors.red),
                    const SizedBox(width: 5),
                    Text(
                      "$calorias kcal",
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff909090),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(24))),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz,
                size: 22,
              ),
            ),
          )
        ],
      ),
    );
  }
}
