import 'dart:io';
import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:food_ia/screens/preview_page.dart';
import 'package:food_ia/widgets/anexo.dart';
import 'package:food_ia/widgets/botao_principal.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';

class ScanView extends StatefulWidget {
  const ScanView({super.key});

  @override
  State<ScanView> createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
  File? arquivo;
  final picker = ImagePicker();
  GenerateContentResponse? alimentos;
  String? result;
  List<Map<String, String>> resultadoFinal = [];
  Future<void> AnalisarImagem() async {
    final model = GenerativeModel(
        model: 'gemini-pro-vision',
        apiKey: "AIzaSyCW-05ReYmeQPM7_fQgkJ5cxwPJwqzdmtM");
    const prompt =
        'Quais alimentos estao na foto retorne colocando os alimentos dentro de colchetes e seus respectivos valores caloricos a cada 100g';
    final imageBytes = await File(arquivo!.path).readAsBytes();
    final content = [
      Content.multi([
        TextPart(prompt),
        DataPart('image/png', imageBytes),
      ])
    ];
    alimentos = await model.generateContent(content);
    setState(() {
      result = alimentos!.text;

      // resultadoFinal = result!;
    });
    List<String> lines = result!.split('\n');
    for (String line in lines) {
      RegExp regExp = RegExp(r'\[([^\]]+)\]\s+\((\d+)\s+calorias\)');
      Match? match = regExp.firstMatch(line);
      if (match != null) {
        String name = match.group(1)!;
        String calories = match.group(2)!;
        resultadoFinal.add({'nome': name, 'caloria': calories});
      }
    }
    setState(() {});
  }

  Future getFileFromGallery() async {
    final file = await picker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() {
        arquivo = File(file.path);
      });
    }
  }

  showPreview(file) async {
    file = await await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PreviewPage(file: file),
      ),
    );

    if (file != null) {
      setState(() {
        arquivo = file;
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (arquivo != null) Anexo(arquivo: arquivo!),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CameraCamera(
                      onFile: (file) => showPreview(file),
                    ),
                  ),
                ),
                child: const Text("Tirar uma foto"),
              ),
              TextButton(
                onPressed: () => getFileFromGallery(),
                child: const Text("Selecionar um arquivo"),
              ),
              Text(result?.toString().isEmpty ?? true
                  ? "sem nada"
                  : result.toString()),
              // Expanded(
              //   child: ListView.builder(
              //     itemBuilder: (context, index) {
              //       return Text(alimentos);
              //     },
              //   ),
              // ),
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: resultadoFinal.length,
              //     itemBuilder: (context, index) {
              //       return ListTile(
              //         title: Text(resultadoFinal[index]['nome']!),
              //         subtitle:
              //             Text('${resultadoFinal[index]['caloria']} calorias'),
              //       );
              //     },
              //   ),
              // ),
              BotaoPrincipal(
                hintText: "Analisar",
                color: Colors.blueAccent,
                onTap: () {
                  if (arquivo != null) {
                    AnalisarImagem();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
