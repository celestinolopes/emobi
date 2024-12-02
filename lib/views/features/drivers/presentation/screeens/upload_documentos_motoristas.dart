import 'dart:io';

import 'package:e_mobi/core/navigation/navigation_service.dart';
import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/drivers/presentation/controllers/upload_licenca_controller.dart';
import 'package:e_mobi/views/features/drivers/presentation/screeens/cadastro_veiculo.dart';
import 'package:e_mobi/views/features/drivers/presentation/screeens/view_pdf.dart';
import 'package:e_mobi/views/features/drivers/presentation/widgets/custom_upload_card.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_archive_button.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/helper.dart';
import '../controllers/upload_comprovante.dart';
import '../controllers/upload_cpf_controller.dart';

class UploadDocumentosMotorista extends StatelessWidget {
  UploadDocumentosMotorista({super.key});
  final uploadCpfController = Get.put(UploadCpfController());
  final uploadComprovanteController = Get.put(UploadComprovanteController());
  final uploadLicencaController = Get.put(UploadLicencaController());
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
                  // homeController.handleUploadFile(context);
                  uploadCpfController.handleUploadFile(context);
                },
              ),
              const SizedBox(height: 5),
              GetBuilder(
                  init: uploadCpfController,
                  id: "cpfDoc",
                  builder: (context) {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      itemCount: uploadCpfController.filesList.length,
                      itemBuilder: (context, idx) {
                        return InkWell(
                          onTap: () {
                            NavigationService.push(
                                context: context,
                                page: ViewPdfPage(
                                  path: uploadCpfController.filesList[idx].path,
                                ));
                          },
                          child: CustomCardUploadFile(
                            isSended: uploadCpfController.cpfStatusUpload ==
                                CpfStatusUpload.success,
                            isLoading: uploadCpfController.cpfStatusUpload ==
                                CpfStatusUpload.loading,
                            onTap: () => uploadCpfController.removeItem(idx),
                            index: idx,
                            name: UploadController.getFileName(
                              uploadCpfController.filesList[idx],
                            ),
                            icon: UploadController.checkTypeFile(
                              uploadCpfController.filesList[idx],
                            ),
                            size: UploadController.getFileSize(
                              uploadCpfController.filesList[idx],
                            ),
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
              CustomArchiveButton(
                color: Colors.white,
                textColor: PalleteColors.primaryColor,
                text: "Comprovante de residência",
                assetIcon: "file_black.png",
                onClick: () {
                  uploadComprovanteController.handleUploadFile(context);
                },
              ),
              const SizedBox(height: 5),
              GetBuilder(
                  init: uploadComprovanteController,
                  id: "comprovanteDoc",
                  builder: (context) {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      itemCount: uploadComprovanteController.filesList.length,
                      itemBuilder: (context, idx) {
                        return CustomCardUploadFile(
                          isSended: uploadComprovanteController
                                  .comprovanteStatusUpload ==
                              ComprovanteStatusUpload.success,
                          isLoading: uploadComprovanteController
                                  .comprovanteStatusUpload ==
                              ComprovanteStatusUpload.loading,
                          onTap: () =>
                              uploadComprovanteController.removeItem(idx),
                          index: idx,
                          name: UploadController.getFileName(
                            uploadComprovanteController.filesList[idx],
                          ),
                          icon: UploadController.checkTypeFile(
                            uploadComprovanteController.filesList[idx],
                          ),
                          size: UploadController.getFileSize(
                            uploadComprovanteController.filesList[idx],
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
              CustomArchiveButton(
                color: Colors.white,
                textColor: PalleteColors.primaryColor,
                text: "Licença de condução escolar",
                assetIcon: "file_black.png",
                onClick: () {
                  uploadLicencaController.handleUploadFile(context);
                },
              ),
              const SizedBox(height: 5),
              GetBuilder(
                  init: uploadLicencaController,
                  id: "licencaDoc",
                  builder: (context) {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      itemCount: uploadLicencaController.filesList.length,
                      itemBuilder: (context, idx) {
                        return CustomCardUploadFile(
                          isSended: uploadLicencaController
                                  .licencaConducaoStatusUpload ==
                              LicencaConducaoStatusUpload.success,
                          isLoading: uploadLicencaController
                                  .licencaConducaoStatusUpload ==
                              LicencaConducaoStatusUpload.loading,
                          onTap: () => uploadLicencaController.removeItem(idx),
                          index: idx,
                          name: UploadController.getFileName(
                            uploadLicencaController.filesList[idx],
                          ),
                          icon: UploadController.checkTypeFile(
                            uploadLicencaController.filesList[idx],
                          ),
                          size: UploadController.getFileSize(
                            uploadLicencaController.filesList[idx],
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
                        builder: (_) => CadastroVeiculoMotorista(),
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
    final XFile? image = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 300,
      maxHeight: 300,
    );

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
        height: 300,
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
                    fit: BoxFit.contain,
                    width: 150,
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
