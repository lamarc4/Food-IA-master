import 'package:flutter/material.dart';
import 'package:food_ia/widgets/botao_principal.dart';
import 'package:food_ia/widgets/form_field.dart';
import 'package:google_fonts/google_fonts.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _emailCadastro = TextEditingController();
  final TextEditingController _senhaCadastro = TextEditingController();
  final TextEditingController _confirmaSenhaCadastro = TextEditingController();
  bool escondidoSenha = true;
  bool escondidoConfirmaSenha = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child: CircleAvatar(
                      radius: 62,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Cadastro",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Tenha acesso a diversos recursos para sua alimentação",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Este campo é obrigatório!";
                                }
                                return null;
                              },
                              formController: _emailCadastro,
                              labelText: "Email",
                              senha: false,
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            CustomFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Este campo é obrigatório!";
                                }
                                return null;
                              },
                              labelText: "Senha",
                              senha: escondidoSenha,
                              formController: _senhaCadastro,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  escondidoSenha
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    escondidoSenha = !escondidoSenha;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            CustomFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Este campo é obrigatório!";
                                }
                                return null;
                              },
                              labelText: "Repetir senha",
                              senha: escondidoConfirmaSenha,
                              formController: _confirmaSenhaCadastro,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  escondidoConfirmaSenha
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    escondidoConfirmaSenha =
                                        !escondidoConfirmaSenha;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 62,
                            ),
                            const BotaoPrincipal(
                                hintText: "Logar", color: Color(0xfff67cfcf)),
                            const SizedBox(
                              height: 26,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Já possui conta? ",
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: Text(
                                    "Logar",
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          color: Color(0xfff31d6d6),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 26,
                            ),
                          ],
                        )),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
