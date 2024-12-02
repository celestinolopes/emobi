import 'package:e_mobi/core/navigation/navigation_service.dart';
import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/drivers/presentation/controllers/helper.dart';
import 'package:e_mobi/views/features/drivers/presentation/screeens/view_pdf.dart';
import 'package:e_mobi/views/features/drivers/presentation/widgets/custom_upload_card.dart';
import 'package:e_mobi/views/features/parents/presentation/controllers/responsavel_comprovante_upload.dart';
import 'package:e_mobi/views/features/parents/presentation/controllers/responsavel_upload_cpf.dart';
import 'package:e_mobi/views/features/parents/presentation/screens/register_child_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_archive_button.dart';
import '../widgets/custom_text.dart';
import 'cadastro_segundo_responsavel.dart';

class UploadDocumentosResponsavel extends StatelessWidget {
  UploadDocumentosResponsavel({super.key});
  final uploadCpfController = Get.put(UploadCpfResponsavelController());
  final uploadComprovanteController =
      Get.put(UploadComprovanteResponsavelController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
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
              text: "Documento do responsável",
              fontSize: 16,
              fontWeight: FontWeight.w800,
              textAlign: TextAlign.center,
              color: PalleteColors.accentColor,
            ),
            const SizedBox(height: 20),
            const CustomUploadButton(),
            const SizedBox(height: 4),
            const Center(
              child: CustomText(
                  text: "Tire uma foto com o seu documento de identidade",
                  fontSize: 12,
                  color: PalleteColors.primaryColor),
            ),
            const SizedBox(height: 70),
            CustomArchiveButton(
              text: "CPF/RG",
              assetIcon: "archive.png",
              onClick: () {
                uploadCpfController.handleUploadFile(context);
              },
            ),
            const SizedBox(height: 5),
            GetBuilder(
                init: uploadCpfController,
                id: "cpfDocResponsavel",
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
                          isFail: uploadCpfController.cpfStatusUpload ==
                              CpfStatusUpload.fail,
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
              text: "Comprovante de residência",
              assetIcon: "archive.png",
              onClick: () {
                uploadComprovanteController.handleUploadFile(context);
              },
            ),
            const SizedBox(height: 5),
            GetBuilder(
                init: uploadComprovanteController,
                id: "comprovanteDocResponsavel",
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
                            ComprovanteResponsavelStatusUpload.success,
                        isLoading: uploadComprovanteController
                                .comprovanteStatusUpload ==
                            ComprovanteResponsavelStatusUpload.loading,
                        isFail: uploadComprovanteController
                                .comprovanteStatusUpload ==
                            ComprovanteResponsavelStatusUpload.fail,
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
              text: "Cadastrar 2. Responsável",
              assetIcon: "arrow.png",
              onClick: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => const CadastroSegundoResponsavel(),
                  ),
                );
              },
            ),
            const SizedBox(height: 5),
            const Center(
                child:
                    CustomText(text: "Ou", fontSize: 12, color: Colors.black)),
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
