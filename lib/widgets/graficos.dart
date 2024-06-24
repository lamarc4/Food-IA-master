import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_ia/widgets/grafico_linear_pequeno.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Graficos extends StatefulWidget {
  const Graficos({super.key});

  @override
  State<Graficos> createState() => _GraficosState();
}

class _GraficosState extends State<Graficos> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GraficoLinearPequeno(
                  titulo: "Calorias",
                  cor: const Color(0xff55BB8B),
                  corBackground: const Color(0xff55BB8B).withOpacity(0.3),
                  meta: "1350/2000",
                  porcentagem: 0.4),
              const SizedBox(
                height: 10,
              ),
              GraficoLinearPequeno(
                  titulo: "Proteinas",
                  cor: const Color(0xffC74D50),
                  corBackground: const Color(0xffC74D50).withOpacity(0.3),
                  meta: "1350 /200g",
                  porcentagem: 0.4),
            ],
          ),
        ),
        CircularPercentIndicator(
          animation: true,
          radius: 90,
          lineWidth: 20,
          percent: 0.4,
          animationDuration: 2000,
          progressColor: const Color(0xff55BB8B),
          backgroundColor: const Color(0xffDBF0E6),
          circularStrokeCap: CircularStrokeCap.round,
          center: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "1350",
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff1c1c1c)),
                ),
              ),
              Text(
                "Calorias restantes",
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff909090)),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GraficoLinearPequeno(
                  titulo: "Gorduras",
                  cor: const Color(0xffDEC15C),
                  corBackground: const Color(0xffDEC15C).withOpacity(0.3),
                  meta: "1350 /200g",
                  porcentagem: 0.4),
              const SizedBox(
                height: 10,
              ),
              GraficoLinearPequeno(
                  titulo: "Carbo",
                  cor: const Color(0xff72AED9),
                  corBackground: const Color(0xff72AED9).withOpacity(0.3),
                  meta: "1350 /200g",
                  porcentagem: 0.4),
            ],
          ),
        ),
      ],
    );
  }
}
