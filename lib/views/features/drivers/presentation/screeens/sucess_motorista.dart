import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/drivers/presentation/screeens/sucess_motorista2.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_archive_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaerabensMotorista extends StatelessWidget {
  const PaerabensMotorista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Parabéns !".toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w900,
                  color: PalleteColors.primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Image.asset(
              "assets/images/like.png",
              width: 100,
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Estamos validando o seu cadastro\n Em breve te notificaremos ;)",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: PalleteColors.primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 150),
            SizedBox(
              width: 200,
              child: CustomArchiveButton(
                text: "Continuar",
                centered: true,
                space: 10,
                showIcon: false,
                textColor: PalleteColors.white,
                assetIcon: "seta_dark.png",
                color: PalleteColors.primaryColor,
                textAlign: TextAlign.center,
                onClick: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (_) => const PaerabensMotorista2(),
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
