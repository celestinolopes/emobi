import 'dart:io';

import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/drivers/presentation/controllers/home_controller.dart';
import 'package:e_mobi/views/features/drivers/presentation/screeens/cadastro_veiculo.dart';
import 'package:e_mobi/views/features/drivers/presentation/widgets/custom_upload_card.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_archive_button.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadDocumentosMotorista extends StatelessWidget {
  UploadDocumentosMotorista({super.key});
  final homeController = Get.put(HomeController());
  final comprovanteController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PalleteColors.primaryColor,
      appBar: AppBar(
        backgroundColor: PalleteColors.primaryColor,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: SingleChildScrollView(
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
                color: Colors.white,
              ),
              const SizedBox(height: 20),
              const CustomText(
                text: "Documentos do motorista",
                fontSize: 16,
                fontWeight: FontWeight.w800,
                textAlign: TextAlign.center,
                color: PalleteColors.accentColor,
              ),
              const SizedBox(height: 20),
              const CustomUploadButton(),
              const SizedBox(height: 6),
              const CustomText(
                text: "Tire uma foto com o seu documento de identidade",
                fontSize: 12,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
                color: Colors.white,
              ),
              const SizedBox(height: 4),
              const CustomText(
                  text: "Tire uma foto com o seu documento de identidade",
                  fontSize: 12,
                  color: PalleteColors.primaryColor),
              const SizedBox(height: 70),
              CustomArchiveButton(
                color: Colors.white,
                textColor: PalleteColors.primaryColor,
                text: "CPF/RG",
                assetIcon: "file_black.png",
                onClick: () {
                  homeController.handleUploadFile(context);
                },
              ),
              const SizedBox(height: 5),
              GetBuilder(
                  init: homeController,
                  id: "home",
                  builder: (context) {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: homeController.filesList.length,
                      itemBuilder: (context, idx) {
                        return CustomCardUploadFile(
                          onTap: () => homeController.removeItem(idx),
                          index: idx,
                          name: homeController.getFileName(
                            homeController.filesList[idx],
                          ),
                          icon: homeController.checkTypeFile(
                            homeController.filesList[idx],
                          ),
                          size: homeController.getFileSize(
                            homeController.filesList[idx],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 5,
                        );
                      },
                    );
                  }),
              const SizedBox(height: 10),
              CustomArchiveButton(
                color: Colors.white,
                textColor: PalleteColors.primaryColor,
                text: "Comprovante de residência",
                assetIcon: "file_black.png",
                onClick: () {
                  comprovanteController.handleUploadFile(context);
                },
              ),
              GetBuilder(
                  init: comprovanteController,
                  id: "comprovante",
                  builder: (context) {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: comprovanteController.filesList.length,
                      itemBuilder: (context, idx) {
                        return CustomCardUploadFile(
                          onTap: () => comprovanteController.removeItem(idx),
                          index: idx,
                          name: comprovanteController.getFileName(
                            comprovanteController.filesList[idx],
                          ),
                          icon: comprovanteController.checkTypeFile(
                            comprovanteController.filesList[idx],
                          ),
                          size: comprovanteController.getFileSize(
                            comprovanteController.filesList[idx],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 5,
                        );
                      },
                    );
                  }),
              const SizedBox(height: 10),
              CustomArchiveButton(
                color: Colors.white,
                textColor: PalleteColors.primaryColor,
                text: "Licença de condução escolar",
                assetIcon: "file_black.png",
                onClick: () {},
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
                        builder: (_) => const CadastroVeiculoMotorista(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomUploadButton extends StatefulWidget {
  const CustomUploadButton({
    super.key,
  });

  @override
  State<CustomUploadButton> createState() => _CustomUploadButtonState();
}

class _CustomUploadButtonState extends State<CustomUploadButton> {
  final ImagePicker _picker = ImagePicker();
  bool isTaked = false;
  late File imagemDentro, imagemFora, imagemCompressor;

  Future<void> pickImageDentro({bool isModal = false}) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      isTaked = true;
      imagemDentro = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        pickImageDentro();
      },
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isTaked
                ? Image.file(
                    imagemDentro,
                  )
                : Image.asset(
                    "assets/images/upload_with.png",
                    width: 100,
                  )
          ],
        ),
      ),
    );
  }
}
