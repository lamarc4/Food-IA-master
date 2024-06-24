import 'dart:io';

import 'package:flutter/material.dart';

class Anexo extends StatelessWidget {
  final File arquivo;

  const Anexo({super.key, required this.arquivo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 2,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Image.file(
          arquivo,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}
