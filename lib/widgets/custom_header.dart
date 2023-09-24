import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String header;
  final double size;

  const CustomHeader({
    super.key,
    required this.header,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      header,
      style: TextStyle(
        fontFamily: 'SP600',
        fontSize: size,
        color: const Color(0xFF23303B),
      ),
    );
  }
}
