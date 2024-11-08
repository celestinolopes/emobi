import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/childrens/presentation/screens/success.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_archive_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExperienciaMotorista extends StatelessWidget {
  const ExperienciaMotorista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PalleteColors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: PalleteColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Center(
              child: Text(
                "Diga-nos".toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 2),
            Center(
              child: Text(
                "O que achou da experiÊncia?".toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 100),
            const Text(
              "Deixe um comentário abaixo",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 3),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10),
              child: const TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 80),
            const Text(
              "Ou, clique em finalizar",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 3),
            const SizedBox(height: 25),
            SizedBox(
              width: 200,
              child: CustomArchiveButton(
                text: "Finalizar",
                centered: true,
                space: 10,
                textColor: PalleteColors.primaryColor,
                assetIcon: "seta_dark.png",
                color: PalleteColors.accentColor,
                textAlign: TextAlign.center,
                onClick: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (_) => const ParabensAvaliacao(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
