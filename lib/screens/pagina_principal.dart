import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:food_ia/widgets/cardAnimado.dart';
import 'package:food_ia/widgets/card_agua.dart';
import 'package:food_ia/widgets/card_alimentacao.dart';
import 'package:food_ia/widgets/graficos.dart';
import 'package:food_ia/widgets/header.dart';
import 'package:food_ia/widgets/menu_tab.dart';
import 'package:google_fonts/google_fonts.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal>
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

  final EasyInfiniteDateTimelineController _controller =
      EasyInfiniteDateTimelineController();
  DateTime? _focusDate;

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
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Header(),
                  SizedBox(
                    height: 20,
                  ),
                  EasyDateTimeLine(
                    locale: "pt-br",
                    initialDate: DateTime.now(),
                    onDateChange: (selectedDate) {
                      // `selectedDate` the new date selected.
                    },
                    activeColor: const Color(0xff55BB8B),
                    headerProps: const EasyHeaderProps(showHeader: false),
                    dayProps: const EasyDayProps(
                      height: 56.0,
                      width: 56.0,
                      dayStructure: DayStructure.dayNumDayStr,
                      inactiveDayStyle: DayStyle(
                        borderRadius: 48.0,
                        dayNumStyle: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      activeDayStyle: DayStyle(
                        dayNumStyle: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Center(child: Graficos()),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: MenuTab(
                      tabs: tabs,
                      controller: _controllerTab!,
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: constraints.maxHeight - 350,
                    ),
                    child: TabBarView(
                      controller: _controllerTab,
                      children: [
                        ListView(
                          padding: const EdgeInsets.all(8),
                          children: const <Widget>[
                            CardAlimentacao(
                              titulo: "Arroz Integral, ovos e salada",
                              calorias: "180",
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Cardanimado(qtdAgua: "1260 /4000ml"),
                            Expanded(
                              child: ListView(
                                padding: const EdgeInsets.all(8),
                                children: const <Widget>[
                                  CardAgua(
                                    quantidadeAgua: "250ml",
                                    horaTomada: "13:12",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
