// ignore_for_file: must_be_immutable

import 'package:e_mobi/views/features/drivers/presentation/controllers/helper.dart';
import 'package:e_mobi/views/features/drivers/presentation/widgets/custom_upload_card.dart';
import 'package:e_mobi/views/features/home/presentation/screens/home_usuario.dart';
import 'package:e_mobi/views/features/parents/presentation/controllers/aluno_comprovante.dart';
import 'package:e_mobi/views/features/parents/presentation/controllers/aluno_photo_upload.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../../pallete_colors.dart';
import '../../../../../widgets/textfield_widget.dart';
import '../widgets/custom_archive_button.dart';

class RegistarCrianca extends StatelessWidget {
  var dateInputFormater = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  var celularMaskedInputIntel = MaskTextInputFormatter(
    mask: '+##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  var celularMaskInputNumber = MaskTextInputFormatter(
    mask: '#####-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  RegistarCrianca({super.key});

  final uploadPhotoAlunoController = Get.put(UploadFotoAllunoController());
  final uploadComprovanteController =
      Get.put(UploadComprovanteAlunoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PalleteColors.primaryColor,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      backgroundColor: PalleteColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Cadastro do aluno",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: PalleteColors.accentColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Nome e sobrenome do aluno",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFieldWidget(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.8),
                      ),
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Data de nascimento",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFieldWidget(
                    keyboadType: TextInputType.number,
                    maskFormatter: [dateInputFormater],
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.8),
                      ),
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Escola",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFieldWidget(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.8),
                      ),
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Série",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFieldWidget(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.8),
                      ),
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Endereço de embarque",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: 204,
                            child: TextFieldWidget(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.8),
                                ),
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Número",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: 150,
                              child: TextFieldWidget(
                                keyboadType: TextInputType.text,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                  borderRadius: BorderRadius.circular(17),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 13),
                  const Center(
                    child: Text(
                      "Documentos do aluno",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: PalleteColors.accentColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomArchiveButton(
                    text: "Foto do aluno",
                    color: Colors.white,
                    textColor: PalleteColors.primaryColor,
                    assetIcon: "photos.png",
                    onClick: () {
                      uploadPhotoAlunoController.uploadPhoto();
                    },
                  ),
                  const SizedBox(height: 5),
                  GetBuilder(
                      init: uploadPhotoAlunoController,
                      id: "photoAluno",
                      builder: (context) {
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          itemCount:
                              uploadPhotoAlunoController.filesList.length,
                          itemBuilder: (context, idx) {
                            return CustomCardUploadFile(
                              onTap: () =>
                                  uploadPhotoAlunoController.removeItem(idx),
                              isLoading: uploadPhotoAlunoController
                                      .photoAlunotatusUpload ==
                                  PhotoAlunotatusUpload.loading,
                              isSended: uploadPhotoAlunoController
                                      .photoAlunotatusUpload ==
                                  PhotoAlunotatusUpload.success,
                              isFail: uploadPhotoAlunoController
                                      .photoAlunotatusUpload ==
                                  PhotoAlunotatusUpload.fail,
                              index: idx,
                              name: UploadController.getFileName(
                                uploadPhotoAlunoController.filesList[idx],
                              ),
                              icon: UploadController.checkTypeFile(
                                uploadPhotoAlunoController.filesList[idx],
                              ),
                              size: UploadController.getFileSize(
                                uploadPhotoAlunoController.filesList[idx],
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
                    assetIcon: "file_white.png",
                    onClick: () {
                      uploadComprovanteController.handleUploadFile(context);
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GetBuilder(
                      init: uploadComprovanteController,
                      id: "comprovanteDocAluno",
                      builder: (context) {
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          itemCount:
                              uploadComprovanteController.filesList.length,
                          itemBuilder: (context, idx) {
                            return CustomCardUploadFile(
                              isSended: uploadComprovanteController
                                      .comprovanteStatusUpload ==
                                  ComprovanteAlunoStatusUpload.success,
                              isLoading: uploadComprovanteController
                                      .comprovanteStatusUpload ==
                                  ComprovanteAlunoStatusUpload.loading,
                              isFail: uploadComprovanteController
                                      .comprovanteStatusUpload ==
                                  ComprovanteAlunoStatusUpload.fail,
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
                    color: PalleteColors.accentColor,
                    textColor: PalleteColors.primaryColor,
                    text: "Cadastrar 3º aluno",
                    assetIcon: "arrow_down.png",
                    onClick: () {},
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      'Ou',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 40,
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
                              builder: (_) => const HomeUsuario(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
