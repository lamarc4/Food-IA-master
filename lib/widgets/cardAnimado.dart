import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Cardanimado extends StatelessWidget {
  final String qtdAgua;
  final Function()? onTap;

  const Cardanimado({
    super.key,
    required this.qtdAgua,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      lineHeight: 70.0,
      percent: 0.5,
      fillColor: Colors.transparent,
      progressColor: const Color(0xff72AED9),
      backgroundColor: const Color(0xffD5E7F4),
      animation: true,
      barRadius: const Radius.circular(11),
      animationDuration: 1000,
      curve: Curves.decelerate,
      center: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sua meta diária",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.water_drop_rounded,
                  color: Colors.white,
                  size: 14,
                ),
                Text(
                  qtdAgua,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
