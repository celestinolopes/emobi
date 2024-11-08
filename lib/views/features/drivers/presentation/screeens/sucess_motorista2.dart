import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/drivers/presentation/screeens/home_motorista.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_archive_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaerabensMotorista2 extends StatelessWidget {
  const PaerabensMotorista2({super.key});

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
                "Legal!".toUpperCase(),
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
              "assets/images/smile.png",
              width: 100,
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "O seu cadastro foi aprovado.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: PalleteColors.primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 4),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 70),
              child: Text(
                "Comece a usar e aumente os seus ganhos.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
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
                showIcon: true,
                textColor: PalleteColors.white,
                assetIcon: "arrow.png",
                color: PalleteColors.accentColor,
                textAlign: TextAlign.center,
                onClick: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (_) => const HomeMotorista(),
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
