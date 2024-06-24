import 'package:flutter/material.dart';
import 'package:food_ia/widgets/botao_principal.dart';
import 'package:google_fonts/google_fonts.dart';

class PosScanner extends StatefulWidget {
  const PosScanner({super.key});

  @override
  State<PosScanner> createState() => _PosScannerState();
}

class _PosScannerState extends State<PosScanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_sharp,
              size: 28,
            )),
        Image.asset(
          fit: BoxFit.fitHeight,
          "assets/croco.jpg",
          width: double.infinity,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2,
            // height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(33),
                    topRight: Radius.circular(33))),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.local_fire_department_rounded,
                        color: Colors.red,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "400kcal",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff909090)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                        checkColor: Colors.white,
                        activeColor: const Color(0xff55BB8B),
                      ),
                      Text(
                        "Ovos",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff909090)),
                        ),
                      ),
                      Text(
                        "100",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff909090)),
                        ),
                      ),
                      Text(
                        "gramas",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff909090)),
                        ),
                      ),
                      Text(
                        "20kcal",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff909090)),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  BotaoPrincipal(
                      hintText: "Adicionar Alimentos", color: Colors.green)
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
