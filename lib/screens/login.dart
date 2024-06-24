import 'package:flutter/material.dart';
import 'package:food_ia/screens/cadastro.dart';
import 'package:food_ia/widgets/botao_principal.dart';
import 'package:food_ia/widgets/bottom_menu_principal.dart';
import 'package:food_ia/widgets/form_field.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool escondidoSenha = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailLogin = TextEditingController();
  final TextEditingController _senhaLogin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
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
                    "Login",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Bem vindo, digite suas credenciais e acesse a plataforma",
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
                              formController: _emailLogin,
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
                              formController: _senhaLogin,
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
                              height: 62,
                            ),
                            BotaoPrincipal(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const BottomMenuPrincipal())),
                                hintText: "Logar",
                                color: const Color(0xfff67cfcf)),
                            const SizedBox(
                              height: 26,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Não possui conta? ",
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Cadastro())),
                                  child: Text(
                                    "Cadastrar",
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
