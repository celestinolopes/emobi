import 'dart:developer';
import 'dart:io';

import 'package:e_mobi/core/di/di_container.dart';
import 'package:e_mobi/core/navigation/navigation_service.dart';
import 'package:e_mobi/core/widgets/confirm_terms_button.dart';
import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/childrens/presentation/screens/register_child_view.dart';
import 'package:e_mobi/views/features/drivers/presentation/controllers/helper.dart';
import 'package:e_mobi/views/features/drivers/presentation/screeens/view_pdf.dart';
import 'package:e_mobi/views/features/drivers/presentation/widgets/custom_upload_card.dart';
import 'package:e_mobi/views/features/parents/presentation/controllers/responsavel_comprovante_upload.dart';
import 'package:e_mobi/views/features/parents/presentation/controllers/responsavel_upload_cpf.dart';
import 'package:e_mobi/views/features/upload/domain/repositories/i_ipload_repository.dart';
import 'package:e_mobi/views/features/upload/domain/usecase/upload_document_usecase.dart';
import 'package:e_mobi/widgets/button_custom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toastification/toastification.dart';

import '../widgets/custom_archive_button.dart';
import '../widgets/custom_text.dart';
import 'cadastro_segundo_responsavel.dart';

class UploadDocumentosResponsavel extends StatefulWidget {
  const UploadDocumentosResponsavel({super.key, required this.idResponsavel});
  final int idResponsavel;

  @override
  State<UploadDocumentosResponsavel> createState() =>
      _UploadDocumentosResponsavelState();
}

class _UploadDocumentosResponsavelState
    extends State<UploadDocumentosResponsavel> {
  final uploadCpfController = Get.put(UploadCpfResponsavelController());

  final uploadComprovanteController =
      Get.put(UploadComprovanteResponsavelController());

  bool isAcepted = false;

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
            CustomUploadButton(
              idResponsavel: widget.idResponsavel,
            ),
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
                uploadCpfController.handleUploadFile(
                    context: context, idUser: widget.idResponsavel);
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
                uploadComprovanteController.handleUploadFile(
                    context: context, idUser: widget.idResponsavel);
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
              text: "Cadastrar 2º Responsável",
              assetIcon: "arrow.png",
              onClick: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => CadastroSegundoResponsavel(
                      idResponsave: widget.idResponsavel,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 5),
            const Center(
                child:
                    CustomText(text: "Ou", fontSize: 12, color: Colors.black)),
            const SizedBox(height: 5),
            ConfirmCheckButton(
              isAccepted: isAcepted,
              invertColor: true,
              onChecked: (value) {
                setState(() {
                  isAcepted = !isAcepted;
                });
              },
            ),
            Center(
              child: SizedBox(
                width: 200,
                child: ButtonCustom(
                  IsEnabled: isAcepted,
                  iconRigth: Icons.arrow_forward,
                  backgroundColor: PalleteColors.accentColor,
                  textColor: Colors.white,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  fontWeight: FontWeight.w900,
                  size: const Size(40, 30),
                  height: 40,
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => RegistarCrianca(
                          idResponsavel: widget.idResponsavel,
                        ),
                      ),
                    );
                  },
                  text: "Continuar",
                ),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}

class CustomUploadButton extends StatefulWidget {
  const CustomUploadButton({super.key, required this.idResponsavel});
  final int idResponsavel;
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

    UploadController.getBase64(imagemDentro).then((docInBase64) async {
      final result = await getIt<UploadDocumentUseCase>().call(
        UploadDocParams(
            documento: docInBase64,
            tipoDocumento: "3",
            idUser: widget.idResponsavel),
      );
      result.fold((left) {
        log(name: "Left", "fail");
      }, (right) {
        debugPrint("Documento enviado ");
        toastification.show(
          title: const Text("Documento do responsável enviado com sucesso"),
          style: ToastificationStyle.fillColored,
          autoCloseDuration: const Duration(seconds: 3),
          type: ToastificationType.success,
        );
      });
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
        height: 250,
        decoration: BoxDecoration(
          color: PalleteColors.primaryColor,
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
                    "assets/images/documents.png",
                    width: 100,
                  )
          ],
        ),
      ),
    );
  }
}
