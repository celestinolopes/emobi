import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pallete_colors.dart';
import '../widgets/button_custom_widget.dart';
import 'document_view.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PalleteColors.accentColor,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Falta pouco".toUpperCase(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: PalleteColors.white,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Text(
            "Agora é preciso que nos envie".toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            "Alguns documentos para validação".toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Column(
                children: [
                  Icon(
                    Icons.add_a_photo_outlined,
                    size: 23,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "RG/CPF",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 14),
              const Column(
                children: [
                  Icon(
                    Icons.add_a_photo_outlined,
                    size: 23,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "FOTO COM\nDOCUMENTO",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 14),
              Column(
                children: [
                  const Icon(
                    Icons.add_a_photo_outlined,
                    size: 23,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Comprovativo \nde Residência".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 100),
          SizedBox(
            width: 300,
            child: ButtonCustom(
              iconRigth: Icons.arrow_forward,
              backgroundColor: PalleteColors.white,
              size: const Size(40, 30),
              textColor: Colors.black,
              height: 40,
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => const DocumentView(),
                  ),
                );
              },
              text: "Continuar",
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
