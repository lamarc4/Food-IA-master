import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:food_ia/screens/pagina_principal.dart';
import 'package:food_ia/screens/pos_scanner.dart';
import 'package:food_ia/screens/scanner.dart';

class BottomMenuPrincipal extends StatefulWidget {
  const BottomMenuPrincipal({super.key});

  @override
  State<BottomMenuPrincipal> createState() => _BottomMenuPrincipalState();
}

class _BottomMenuPrincipalState extends State<BottomMenuPrincipal> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        backgroundColor: Colors.black,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.document_scanner_outlined),
          TabItem(icon: Icons.stacked_bar_chart, title: 'Estatísticas'),
        ],
        activeColor: const Color(0xff55BB8B),
        onTap: (int index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Scanner()),
            );
          } else {
            setState(() {
              paginaAtual = index;
              pc.animateToPage(index,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.ease);
            });
          }
        },
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pc,
        onPageChanged: setPaginaAtual,
        children: const [
          PaginaPrincipal(),
          Placeholder(),
          Text("data"),
        ],
      ),
    );
  }
}
