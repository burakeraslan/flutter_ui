import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String hintText;

  const CustomTextInput({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        style: const TextStyle(
          fontFamily: 'SP400',
          fontSize: 17,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: 'SP400',
            fontSize: 17,
            color: Color(0xFF8E949A),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
            bottom: 10,
          ),
          filled: true,
          fillColor: const Color(0x30A4A9AE),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xFF456EFE),
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
