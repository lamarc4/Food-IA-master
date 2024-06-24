import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuTab extends StatelessWidget {
  final List<Tab> tabs;
  final TabController controller;

  const MenuTab({
    super.key,
    required this.tabs,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xffEDEDED),
        borderRadius: BorderRadius.circular(28.0),
      ),
      child: TabBar(
        controller: controller,
        tabs: tabs,
        labelColor: Colors.black,
        indicatorColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        isScrollable: false,
        dividerHeight: 0,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(6),
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: GoogleFonts.inter(
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
