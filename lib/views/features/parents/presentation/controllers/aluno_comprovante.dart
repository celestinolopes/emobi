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

enum ComprovanteAlunoStatusUpload { loading, success, initial, fail }

class UploadComprovanteAlunoController extends GetxController {
  List<File> filesList = [];
  FilePickerResult? result;
  ComprovanteAlunoStatusUpload comprovanteStatusUpload =
      ComprovanteAlunoStatusUpload.initial;
  bool isSended = false;
  void removeItem(int index) {
    filesList.removeAt(index);
    update(['comprovanteDocAluno']);
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

      update(['comprovanteDocAluno']);

      UploadController.getBase64(filesList.last).then(
        (docInBase64) async {
          comprovanteStatusUpload = ComprovanteAlunoStatusUpload.loading;
          update(['comprovanteDocAluno']);

          final result = await getIt<UploadDocumentUseCase>().call(
            UploadDocParams(
                documento: docInBase64, tipoDocumento: "3", idUser: 3),
          );
          result.fold((left) {
            log(name: "Left", "fail");
            comprovanteStatusUpload = ComprovanteAlunoStatusUpload.fail;
            toastification.show(
              title: const Text("Erro ao enviar Comprovante "),
              style: ToastificationStyle.fillColored,
              autoCloseDuration: const Duration(seconds: 3),
              type: ToastificationType.error,
            );
          }, (right) {
            isSended = true;

            debugPrint("Documento enviado com sucesso");

            comprovanteStatusUpload = ComprovanteAlunoStatusUpload.success;
            update(['comprovanteDocAluno']);
            toastification.show(
              title: const Text("Comprovativo enviado com sucesso"),
              style: ToastificationStyle.fillColored,
              autoCloseDuration: const Duration(seconds: 3),
              type: ToastificationType.success,
            );
          });
          update(['comprovanteDocAluno']);
          print(docInBase64);
        },
      );
      debugPrint("-----List $filesList");
    } else {
      debugPrint("No file selected");
      update(['comprovanteDocAluno']);
    }
    update(['comprovanteDocAluno']);
  }

  handleUploadFile(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: const Text("Selecione o documento"),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: const Text("Carregar comprovante de residência"),
              onPressed: () {
                filesList.clear();
                update(['comprovanteDocAluno']);
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
