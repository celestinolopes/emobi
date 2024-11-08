import 'package:flutter/material.dart';

import '../../parents/presentation/widgets/custom_archive_button.dart';
import '../../parents/presentation/widgets/custom_text.dart';

class Transportes extends StatelessWidget {
  const Transportes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/image.png",
            ),
            const SizedBox(height: 70),
            CustomArchiveButton(
              text: "Solicitar motorista",
              assetIcon: "carro.png",
              textColor: Colors.black,
              color: const Color(0xFF4ED52F),
              onClick: () {},
            ),
            const SizedBox(height: 5),
            const CustomText(text: "Ou", fontSize: 12, color: Colors.black),
            const SizedBox(height: 5),
            CustomArchiveButton(
              text: "Já tenho um motorista",
              assetIcon: "carro.png",
              textColor: Colors.black,
              color: const Color(0xFF4ED52F),
              onClick: () {},
            ),
          ],
        ),
      ),
    );
  }
}
