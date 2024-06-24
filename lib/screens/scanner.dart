import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:food_ia/screens/pos_scanner.dart';
import 'package:food_ia/screens/preview_page.dart';
import 'package:food_ia/widgets/anexo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Scanner extends StatefulWidget {
  const Scanner({super.key});

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  File? arquivo;
  final picker = ImagePicker();

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_sharp,
              size: 28,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => showModalBottomSheet<void>(
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
              ),
              child: arquivo == null
                  ? const Text(
                      "Selecione uma imagem",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )
                  : Anexo(arquivo: arquivo!),
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    decoration: const BoxDecoration(
                        color: Color(0XFFEFEFEF),
                        borderRadius: BorderRadius.all(Radius.circular(14))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Image.asset(
                              "assets/camera.jpg",
                              width: 60,
                              height: 60,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Ovos, milho, sopa e jacaré",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Text(
                                "120g • 400kcal",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff909090),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PosScanner()),
                  ),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: const Icon(
                      Icons.add,
                      color: Color(0xff55BB8B),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
