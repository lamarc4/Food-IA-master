import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFormField extends StatelessWidget {
  final String labelText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextEditingController? formController;
  final Widget? suffixIcon;
  final bool senha;

  const CustomFormField(
      {super.key,
      required this.labelText,
      required this.senha,
      this.formController,
      this.onChanged,
      this.validator,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: formController,
        onChanged: onChanged,
        validator: validator,
        obscureText: senha,
        cursorColor: const Color(0xfff9d9d9d),
        decoration: InputDecoration(
          hintText: labelText,
          hintStyle: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  color: Color(0xfff9d9d9d),
                  fontWeight: FontWeight.w400,
                  fontSize: 15)),
          suffixIcon: suffixIcon,
          focusedBorder: const UnderlineInputBorder(
            borderSide:
                BorderSide(color: Color(0xfff9d9d9d)), // Color when focused
          ),
        ),
      );
}
