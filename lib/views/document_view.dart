import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pallete_colors.dart';
import '../widgets/button_custom_widget.dart';
import 'features/parents/presentation/screens/home_pai.dart';

class DocumentView extends StatelessWidget {
  const DocumentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "Envie os documentos necessários\n para validação.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: PalleteColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "Documentos do responsável.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: PalleteColors.accentColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 150,
                decoration: const BoxDecoration(
                  color: PalleteColors.primaryColor,
                ),
                child: const Icon(
                  Icons.photo_album,
                  color: Colors.white,
                ),
              ),
              const Center(
                child: Text(
                  "Tire uma foto com o seu documento de identidade",
                  style: TextStyle(fontSize: 13),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 40,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: const BoxDecoration(
                  color: PalleteColors.primaryColor,
                ),
                child: const Row(
                  children: [
                    Text(
                      "CPF/RG",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.archive_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 40,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: const BoxDecoration(
                  color: PalleteColors.primaryColor,
                ),
                child: Row(
                  children: [
                    Text(
                      "Comprovante de Residência".toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.archive_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "Documentos da criança",
                style: TextStyle(
                  fontSize: 15,
                  color: PalleteColors.accentColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 40,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: const BoxDecoration(
                  color: PalleteColors.primaryColor,
                ),
                child: Row(
                  children: [
                    Text(
                      "Foto da criança".toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 40,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: const BoxDecoration(
                  color: PalleteColors.primaryColor,
                ),
                child: Row(
                  children: [
                    Text(
                      "Documento da criança".toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.archive_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 40,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: const BoxDecoration(
                  color: PalleteColors.primaryColor,
                ),
                child: Row(
                  children: [
                    Text(
                      "Cadastrar 2º responsável".toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.archive_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 300,
                child: ButtonCustom(
                  iconRigth: Icons.arrow_forward,
                  backgroundColor: PalleteColors.accentColor,
                  size: const Size(40, 30),
                  height: 40,
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => const HomePaiView(),
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
        ),
      ),
    );
  }
}
