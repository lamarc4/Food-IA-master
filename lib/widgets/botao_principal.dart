import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BotaoPrincipal extends StatelessWidget {
  final String hintText;
  final Color color;
  final bool? carregando;
  final Function()? onTap;

  const BotaoPrincipal({
    super.key,
    required this.hintText,
    required this.color,
    this.carregando,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: color),
        height: 60,
        width: double.infinity,
        child: Align(
          alignment: Alignment.center,
          child: carregando != null && carregando == true
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.white,
                ))
              : Text(
                  hintText,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  )),
                ),
        ),
      ),
    );
  }
}
