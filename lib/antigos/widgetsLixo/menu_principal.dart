import 'package:flutter/material.dart';
import 'package:food_ia/widgets/menu_tab.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPrincipal extends StatefulWidget {
  const MenuPrincipal({super.key});

  @override
  State<MenuPrincipal> createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal>
    with TickerProviderStateMixin {
  int _paginaAtual = 0;
  TabController? _controllerTab;

  @override
  void initState() {
    super.initState();
    _controllerTab = TabController(length: 2, vsync: this);
    _controllerTab!.addListener(() {
      setState(() {
        _paginaAtual = _controllerTab!.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = [
      Tab(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.restaurant,
              size: 14,
              color: _paginaAtual == 0 ? Colors.green : Colors.grey,
            ),
            const SizedBox(width: 8),
            Text(
              "Alimentação",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: _paginaAtual == 0 ? Colors.green : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
      Tab(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.water,
              size: 14,
              color: _paginaAtual == 1 ? Colors.blue : Colors.grey,
            ),
            const SizedBox(width: 8),
            Text(
              "Hidratação",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: _paginaAtual == 1 ? Colors.blue : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      )
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 32, right: 32),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MenuTab(
                tabs: tabs,
                controller: _controllerTab!,
              ),
              const SizedBox(height: 60),
              Expanded(
                child: TabBarView(
                  controller: _controllerTab,
                  children: const [
                    Text("Alimentação Content"),
                    Text("Hidratação Content"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
