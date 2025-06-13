import 'package:e_mobi/pallete_colors.dart';
import 'package:flutter/material.dart';

class EscolasDetalhes extends StatelessWidget {
  const EscolasDetalhes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PalleteColors.primaryColor,
      appBar: AppBar(
        backgroundColor: PalleteColors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Center(
              child: Text(
                "ESCOLA".toUpperCase(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: PalleteColors.white,
                ),
              ),
            ),
            const SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}
