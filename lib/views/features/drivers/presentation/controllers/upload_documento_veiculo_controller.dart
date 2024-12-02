import 'dart:developer';
import 'dart:io';

import 'package:e_mobi/core/di/di_container.dart';
import 'package:e_mobi/views/features/drivers/presentation/controllers/helper.dart';
import 'package:e_mobi/views/features/upload/domain/repositories/i_ipload_repository.dart';
import 'package:e_mobi/views/features/upload/domain/usecase/upload_document_usecase.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:toastification/toastification.dart';

enum DocVeiculoStatusUpload { loading, success, initial, fail }

class UploadDocumentoVeiculoController extends GetxController {
  DocVeiculoStatusUpload docVeiculoStatusUpload =
      DocVeiculoStatusUpload.initial;

  List<File> filesList = [];
  FilePickerResult? result;
  bool isSended = false;
  void removeItem(int index) {
    filesList.removeAt(index);
    update(['docVeiculo']);
  }

  Future<void> uploadFile() async {
    result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowCompression: true,
      allowedExtensions: [
        'pdf',
        'xls',
      ],
    );

    if (result != null) {
      var listTemp = result!.paths.map((path) => File(path!)).toList();
      filesList.addAll(listTemp.take(5 - filesList.length));
      update(['docVeiculo']);
      Future.delayed(const Duration(seconds: 4), () {
        isSended = true;
        update(['docVeiculo']);
      });
      UploadController.getBase64(filesList.last).then(
        (docInBase64) async {
          docVeiculoStatusUpload = DocVeiculoStatusUpload.loading;
          update(['docVeiculo']);

          final result = await getIt<UploadDocumentUseCase>().call(
            UploadDocParams(
                documento: docInBase64, tipoDocumento: "3", idUser: 3),
          );
          result.fold((left) {
            log(name: "Left", "fail");
            docVeiculoStatusUpload = DocVeiculoStatusUpload.fail;
          }, (right) {
            isSended = true;

            debugPrint("Documento enviado com sucesso");
            docVeiculoStatusUpload = DocVeiculoStatusUpload.success;
            toastification.show(
              title: const Text("Documento do veiculo enviado com sucesso"),
              style: ToastificationStyle.fillColored,
              autoCloseDuration: const Duration(seconds: 3),
              type: ToastificationType.success,
            );
            update(['docVeiculo']);
          });
          update(['docVeiculo']);
          print(docInBase64);
        },
      );
      debugPrint("-----List $filesList");
    } else {
      debugPrint("No file selected");
      update(['docVeiculo']);
    }
    update(['docVeiculo']);
  }

  handleUploadFile(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: const Text("Selecione o documento"),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: const Text("Carregar documento do veiculo"),
              onPressed: () {
                filesList.clear();
                update(['docVeiculo']);
                uploadFile();
                Navigator.pop(context);
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text("Cancelar"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}
