import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/home/presentation/screens/home_usuario.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_archive_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ParabensAvaliacao extends StatelessWidget {
  const ParabensAvaliacao({super.key});

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
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Image.asset("assets/images/palmas.png"),
            const SizedBox(height: 20),
            const Text(
              "Você acaba de contribuir com  o aprimoramento dos nossos serviços.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
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
                color: PalleteColors.accentColor,
                textAlign: TextAlign.center,
                onClick: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (_) => const HomeUsuario(),
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
