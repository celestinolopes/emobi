import 'package:flutter/material.dart';

import '../pallete_colors.dart';

class HomePaiView extends StatelessWidget {
  const HomePaiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PalleteColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                color: PalleteColors.accentColor,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: 300,
                height: 40,
                child: const Text(
                  "Olá, Lucas",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
