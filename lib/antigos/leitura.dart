import 'dart:io';
import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:food_ia/screens/preview_page.dart';
import 'package:food_ia/widgets/anexo.dart';
import 'package:food_ia/widgets/botao_principal.dart';
import 'package:food_ia/widgets/card_expandido.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';

class Leitura extends StatefulWidget {
  const Leitura({super.key});

  @override
  State<Leitura> createState() => _LeituraState();
}

class _LeituraState extends State<Leitura> {
  List<Food> foodList = [
    Food(
        name: 'Arroz',
        quantity: '100',
        carbs: '45g',
        fats: '27g',
        protein: '27g'),
    Food(
        name: 'Feijão',
        quantity: '100',
        carbs: '53g',
        fats: '14g',
        protein: '21g'),
    // Adicione mais alimentos conforme necessário
  ];

  File? arquivo;
  final picker = ImagePicker();
  GenerateContentResponse? alimentos;
  String? result;
  List<Map<String, String>> resultadoFinal = [];
  bool carregando = false;

  late final GenerativeModel modelChat;
  late final GenerativeModel modelImage;

  Future<void> TransformaMensagem(String result) async {
    try {
      final prompt =
          '$result, I would like you to put the food in the format: [food: calories, carbs, fat, protein]. Make sure each answer follows this format. Here are some examples to guide you: Apple: 52 calories Banana: 89 calories Broccoli: 55 calories Follow this standard strictly for all the foods mentioned, translate into Portuguese - Brazil.';

      final content = [Content.text(prompt)];
      final response = await modelChat.generateContent(content);

      print(response.text);
    } finally {
      setState(() {
        carregando = false;
      });
    }
  }

  Future<void> AnalisaSaida(String result) async {
    try {
      final prompt =
          '$result,  Give me the approximate calories, carbohydrates, fat and protein of each food for every 100g, leave each food in brackets and be brief';
      final content = [Content.text(prompt)];
      final response = await modelChat.generateContent(content);
      print(response.text);

      TransformaMensagem(response.text.toString());
    } catch (e) {}
  }

  Future<void> AnalisarImagem() async {
    try {
      setState(() {
        resultadoFinal = [];
        carregando = true;
      });

      const prompt = 'return to me all the food in the image in brackets';
      final imageBytes = await File(arquivo!.path).readAsBytes();
      final content = [
        Content.multi([
          TextPart(prompt),
          DataPart('image/png', imageBytes),
        ])
      ];
      alimentos = await modelImage.generateContent(content);
      print(alimentos!.text);

      AnalisaSaida(alimentos!.text.toString());

      // List<String> lines = result!.split('\n');
      // for (String line in lines) {
      //   RegExp regExp = RegExp(r'\[([^\]]+)\]\s+\((\d+)\s+calorias\)');
      //   Match? match = regExp.firstMatch(line);
      //   if (match != null) {
      //     String name = match.group(1)!;
      //     String calories = match.group(2)!;
      //     resultadoFinal.add({'nome': name, 'caloria': calories});
      //   }
      // }
      setState(() {});
    } catch (e) {}
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
  void initState() {
    setState(() {
      modelChat = GenerativeModel(
          model: 'gemini-1.5-flash',
          apiKey: "AIzaSyCW-05ReYmeQPM7_fQgkJ5cxwPJwqzdmtM");
      modelImage = GenerativeModel(
          model: 'gemini-pro-vision',
          apiKey: "AIzaSyCW-05ReYmeQPM7_fQgkJ5cxwPJwqzdmtM");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff40b391),
      appBar: AppBar(
        backgroundColor: const Color(0xfff40b391),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const TelaSelect()),
            // );
          },
        ),
      ),
      body: Column(children: [
        Center(
            child: GestureDetector(
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 200,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CameraCamera(
                                    onFile: (file) => showPreview(file),
                                  ),
                                ),
                              );
                            },
                            child: const Column(
                              children: [
                                Icon(
                                  Icons.camera_alt_outlined,
                                  size: 70,
                                ),
                                Text(
                                  "Tirar foto",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () => getFileFromGallery(),
                            child: const Column(
                              children: [
                                Icon(
                                  Icons.photo_library_outlined,
                                  size: 70,
                                ),
                                Text(
                                  "Escolher foto",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: arquivo == null
              ? const Text(
                  "Selecione uma imagem",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )
              : Anexo(arquivo: arquivo!),
        )),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
          child: BotaoPrincipal(
            carregando: carregando,
            hintText: "Analisar",
            color: const Color(0xfff31d6d6),
            onTap: () => AnalisarImagem(),
          ),
        ),
        // Expanded(
        //   child: ListView.builder(
        //     itemBuilder: (context, index) {
        //       return Text(alimentos.toString());
        //     },
        //   ),
        // ),
        // Expanded(
        //   child: ListView.builder(
        //     itemCount: resultadoFinal.length,
        //     itemBuilder: (context, index) {
        //       return ListTile(
        //         title: Text(resultadoFinal[index]['nome']!),
        //         subtitle: Text('${resultadoFinal[index]['caloria']} calorias'),
        //       );
        //     },
        //   ),
        // ),
        // CardExpandido(
        //   onChanged: (value) {

        //   },
        //   food: Food(
        //       name: "Arroz",
        //       quantity: "100g",
        //       carbs: "260g",
        //       fats: "20g",
        //       protein: "90g"),
        // ),
        Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: foodList.length,
              itemBuilder: (context, index) {
                return CardExpandido(
                  food: foodList[index],
                  onChanged: (value) {
                    setState(() {
                      foodList[index].isChecked = value ?? false;
                    });
                  },
                );
              }),
        )
      ]),
    );
  }
}
