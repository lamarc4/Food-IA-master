import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class GraficoLinearPequeno extends StatelessWidget {
  final String titulo;
  final double porcentagem;
  final Color cor;
  final Color corBackground;
  final String meta;
  final bool? carregando;

  const GraficoLinearPequeno({
    super.key,
    required this.titulo,
    required this.cor,
    required this.corBackground,
    required this.meta,
    this.carregando,
    required this.porcentagem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          titulo,
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xff909090)),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        LinearPercentIndicator(
          barRadius: const Radius.circular(75),
          width: 80,
          lineHeight: 9,
          percent: 0.5,
          progressColor: cor,
          backgroundColor: corBackground,
          animation: true,
          animationDuration: 2000,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          meta,
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Color(0xff909090)),
          ),
        ),
      ],
    );
  }
}
