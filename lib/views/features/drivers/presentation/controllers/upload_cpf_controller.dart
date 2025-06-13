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

enum CpfStatusUpload { loading, success, initial, fail }

class UploadCpfController extends GetxController {
  List<File> filesList = [];
  FilePickerResult? result;
  CpfStatusUpload cpfStatusUpload = CpfStatusUpload.initial;

  void removeItem(int index) {
    filesList.removeAt(index);
    update(['cpfDoc']);
  }

  Future<void> uploadFile({required int idUser}) async {
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
      update(['cpfDoc']);

      UploadController.getBase64(filesList.last).then(
        (docInBase64) async {
          cpfStatusUpload = CpfStatusUpload.loading;
          update(['cpfDoc']);

          final result = await getIt<UploadDocumentUseCase>().call(
            UploadDocParams(
                documento: docInBase64, tipoDocumento: "4", idUser: idUser),
          );
          result.fold((left) {
            log(name: "Left", "fail");
          }, (right) {
            debugPrint("Documento enviado com sucesso");
            cpfStatusUpload = CpfStatusUpload.success;
            update(['cpfDoc']);

            toastification.show(
              title: const Text("CPF/RG enviado com sucesso"),
              style: ToastificationStyle.fillColored,
              autoCloseDuration: const Duration(seconds: 3),
              type: ToastificationType.success,
            );
          });
          update(['cpfDoc']);
          print(docInBase64);
        },
      );
      debugPrint("-----List $filesList");
    } else {
      debugPrint("No file selected");
      update(['cpfDoc']);
    }
    update(['cpfDoc']);
  }

  handleUploadFile({required BuildContext context, required int idUser}) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: const Text("Selecione o documento"),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: const Text("Carregar CPF/RG"),
              onPressed: () {
                filesList.clear();
                update(['cpfDoc']);
                uploadFile(idUser: idUser);
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
