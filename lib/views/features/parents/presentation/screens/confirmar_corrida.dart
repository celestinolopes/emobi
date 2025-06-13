import 'package:e_mobi/pallete_colors.dart';
import 'package:flutter/material.dart';

class ConfirmarCorrida extends StatelessWidget {
  const ConfirmarCorrida({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PalleteColors.white,
      appBar: AppBar(
        backgroundColor: PalleteColors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Solicitação conluída com sucesso".toUpperCase(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: PalleteColors.primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 4),
            const Text("Aguarde o motorista aceitar a conta"),
            const SizedBox(height: 30),
            Image.asset(
              "assets/images/logo_splash.png",
              width: 120,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Você será informado(a) sobre atualizações dessa solicitação no botão notificações no menu principal do App",
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
