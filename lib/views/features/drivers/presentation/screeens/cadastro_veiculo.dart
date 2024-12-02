import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/drivers/presentation/controllers/helper.dart';
import 'package:e_mobi/views/features/drivers/presentation/controllers/upload_documento_veiculo_controller.dart';
import 'package:e_mobi/views/features/drivers/presentation/controllers/upload_licenca_veiculo_controller.dart';
import 'package:e_mobi/views/features/drivers/presentation/controllers/upload_photo_veiculo.dart';
import 'package:e_mobi/views/features/drivers/presentation/screeens/sucess_motorista.dart';
import 'package:e_mobi/views/features/drivers/presentation/widgets/custom_upload_card.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_archive_button.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_text.dart';
import 'package:e_mobi/widgets/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CadastroVeiculoMotorista extends StatelessWidget {
  CadastroVeiculoMotorista({super.key});

  final uploadDocVeiculoController =
      Get.put(UploadDocumentoVeiculoController());

  final uploadLicencaVeiculoController =
      Get.put(UploadLicencaVeiculoController());
  final uploadFotoVeiculoController = Get.put(UploadFotoVeiculoController());

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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                child: CustomText(
                  text: "Cadastro de veículo",
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  textAlign: TextAlign.center,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const CustomText(
                text: "Veículo",
                fontSize: 14,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              TextFieldWidget(
                textColor: Colors.white,
                cursorColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          text: "Ano de fabricação",
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 10),
                        TextFieldWidget(
                          textColor: Colors.white,
                          cursorColor: Colors.white,
                          keyboadType: TextInputType.number,
                          maskFormatter: const [],
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5),
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          text: "Modelo",
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 10),
                        TextFieldWidget(
                          textColor: Colors.white,
                          cursorColor: Colors.white,
                          keyboadType: TextInputType.number,
                          maskFormatter: const [],
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const CustomText(
                text: "Data de vencimento da licença atual",
                fontSize: 14,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              TextFieldWidget(
                textColor: Colors.white,
                cursorColor: Colors.white,
                keyboadType: TextInputType.number,
                maskFormatter: const [],
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
              const SizedBox(height: 10),
              const CustomText(
                text: "Categoria",
                fontSize: 14,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              TextFieldWidget(
                textColor: Colors.white,
                cursorColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
              const SizedBox(height: 10),
              const CustomText(
                text: "Modelo",
                fontSize: 14,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              TextFieldWidget(
                textColor: Colors.white,
                cursorColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
              const SizedBox(height: 10),
              const CustomText(
                text: "Lotação",
                fontSize: 14,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              TextFieldWidget(
                textColor: Colors.white,
                cursorColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
              const SizedBox(height: 12),
              CustomArchiveButton(
                color: Colors.white,
                textColor: PalleteColors.primaryColor,
                text: "Documentos do veículo",
                assetIcon: "file_black.png",
                onClick: () {
                  uploadDocVeiculoController.handleUploadFile(context);
                },
              ),
              GetBuilder(
                  init: uploadDocVeiculoController,
                  id: "docVeiculo",
                  builder: (context) {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      itemCount: uploadDocVeiculoController.filesList.length,
                      itemBuilder: (context, idx) {
                        return CustomCardUploadFile(
                          onTap: () =>
                              uploadDocVeiculoController.removeItem(idx),
                          index: idx,
                          isLoading: uploadDocVeiculoController
                                  .docVeiculoStatusUpload ==
                              DocVeiculoStatusUpload.loading,
                          isSended: uploadDocVeiculoController
                                  .docVeiculoStatusUpload ==
                              DocVeiculoStatusUpload.success,
                          name: UploadController.getFileName(
                            uploadDocVeiculoController.filesList[idx],
                          ),
                          icon: UploadController.checkTypeFile(
                            uploadDocVeiculoController.filesList[idx],
                          ),
                          size: UploadController.getFileSize(
                            uploadDocVeiculoController.filesList[idx],
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
              const SizedBox(height: 5),
              CustomArchiveButton(
                color: Colors.white,
                textColor: PalleteColors.primaryColor,
                text: "Licença do veiculo",
                assetIcon: "file_black.png",
                onClick: () {
                  uploadLicencaVeiculoController.handleUploadFile(context);
                },
              ),
              const SizedBox(height: 5),
              GetBuilder(
                  init: uploadLicencaVeiculoController,
                  id: "licencaVeiculoDoc",
                  builder: (context) {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      itemCount:
                          uploadLicencaVeiculoController.filesList.length,
                      itemBuilder: (context, idx) {
                        return CustomCardUploadFile(
                          onTap: () =>
                              uploadLicencaVeiculoController.removeItem(idx),
                          index: idx,
                          isLoading: uploadLicencaVeiculoController
                                  .licencaVeiculoStatusUpload ==
                              LicencaVeiculoStatusUpload.loading,
                          isSended: uploadLicencaVeiculoController
                                  .licencaVeiculoStatusUpload ==
                              LicencaVeiculoStatusUpload.success,
                          name: UploadController.getFileName(
                            uploadLicencaVeiculoController.filesList[idx],
                          ),
                          icon: UploadController.checkTypeFile(
                            uploadLicencaVeiculoController.filesList[idx],
                          ),
                          size: UploadController.getFileSize(
                            uploadLicencaVeiculoController.filesList[idx],
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
                text: "Fotos do veículo",
                assetIcon: "file_black.png",
                onClick: () {
                  uploadFotoVeiculoController.uploadPhoto();
                },
              ),
              GetBuilder(
                  init: uploadFotoVeiculoController,
                  id: "photoVeiculo",
                  builder: (context) {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      itemCount: uploadFotoVeiculoController.filesList.length,
                      itemBuilder: (context, idx) {
                        return CustomCardUploadFile(
                          onTap: () =>
                              uploadFotoVeiculoController.removeItem(idx),
                          isLoading: uploadFotoVeiculoController
                                  .photoVeiculoStatusUpload ==
                              PhotoVeiculoStatusUpload.loading,
                          isSended: uploadFotoVeiculoController
                                  .photoVeiculoStatusUpload ==
                              PhotoVeiculoStatusUpload.success,
                          index: idx,
                          name: UploadController.getFileName(
                            uploadFotoVeiculoController.filesList[idx],
                          ),
                          icon: UploadController.checkTypeFile(
                            uploadFotoVeiculoController.filesList[idx],
                          ),
                          size: UploadController.getFileSize(
                            uploadFotoVeiculoController.filesList[idx],
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
              const SizedBox(height: 40),
              CustomArchiveButton(
                color: Colors.white,
                textColor: PalleteColors.primaryColor,
                text: "Cadastrar 2º veículo",
                assetIcon: "seta01.png",
                onClick: () {},
              ),
              const SizedBox(height: 10),
              const Center(
                  child: CustomText(
                      text: "Ou", fontSize: 12, color: Colors.white)),
              const SizedBox(height: 5),
              Center(
                child: SizedBox(
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
                          builder: (_) => const PaerabensMotorista(),
                        ),
                      );
                    },
                  ),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/upload_with.png",
            width: 100,
          )
        ],
      ),
    );
  }
}
