import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/childrens/presentation/screens/register_child_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_archive_button.dart';
import '../widgets/custom_text.dart';
import 'cadastro_segundo_responsavel.dart';

class UploadDocumentosResponsavel extends StatelessWidget {
  const UploadDocumentosResponsavel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomText(
              text: "Envie os documentos necessários\npara a validação",
              fontSize: 16,
              fontWeight: FontWeight.w800,
              textAlign: TextAlign.center,
              color: PalleteColors.primaryColor,
            ),
            const SizedBox(height: 20),
            const CustomText(
              text: "Documentos do responsável",
              fontSize: 16,
              fontWeight: FontWeight.w800,
              textAlign: TextAlign.center,
              color: PalleteColors.accentColor,
            ),
            const SizedBox(height: 20),
            const CustomUploadButton(),
            const SizedBox(height: 4),
            const CustomText(
                text: "Tire uma foto com o seu documento de identidade",
                fontSize: 12,
                color: PalleteColors.primaryColor),
            const SizedBox(height: 70),
            CustomArchiveButton(
              text: "CPF/RG",
              assetIcon: "archive.png",
              onClick: () {},
            ),
            const SizedBox(height: 10),
            CustomArchiveButton(
              text: "Comprovante de residência",
              assetIcon: "archive.png",
              onClick: () {},
            ),
            const Spacer(),
            CustomArchiveButton(
              text: "Cadastrar 2. Responsável",
              assetIcon: "arrow.png",
              onClick: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => CadastroSegundoResponsavel(),
                  ),
                );
              },
            ),
            const SizedBox(height: 5),
            const CustomText(text: "Ou", fontSize: 12, color: Colors.black),
            const SizedBox(height: 5),
            SizedBox(
              width: 200,
              child: CustomArchiveButton(
                text: "Continuar",
                centered: true,
                space: 10,
                assetIcon: "arrow.png",
                color: PalleteColors.accentColor,
                textAlign: TextAlign.center,
                onClick: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (_) => RegistarCrianca(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}

class CustomUploadButton extends StatelessWidget {
  const CustomUploadButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        color: PalleteColors.primaryColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/documents.png",
            width: 100,
          )
        ],
      ),
    );
  }
}
