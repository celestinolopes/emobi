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

enum LicencaConducaoStatusUpload { loading, success, initial, fail }

class UploadLicencaController extends GetxController {
  List<File> filesList = [];
  FilePickerResult? result;
  LicencaConducaoStatusUpload licencaConducaoStatusUpload =
      LicencaConducaoStatusUpload.initial;

  void removeItem(int index) {
    filesList.removeAt(index);
    update(['licencaDoc']);
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
      update(['licencaDoc']);

      UploadController.getBase64(filesList.last).then(
        (docInBase64) async {
          licencaConducaoStatusUpload = LicencaConducaoStatusUpload.loading;
          update(['licencaDoc']);

          final result = await getIt<UploadDocumentUseCase>().call(
            UploadDocParams(
                documento: docInBase64, tipoDocumento: "4", idUser: idUser),
          );
          result.fold((left) {
            log(name: "Left", "falha ao enviar o documento");
          }, (right) {
            debugPrint("Documento enviado com sucesso");
            licencaConducaoStatusUpload = LicencaConducaoStatusUpload.success;
            update(['licencaDoc']);
          });

          update(['licencaDoc']);
          toastification.show(
            title: const Text("Licença de condução enviada com sucesso"),
            style: ToastificationStyle.fillColored,
            autoCloseDuration: const Duration(seconds: 3),
            type: ToastificationType.success,
          );
          print(docInBase64);
        },
      );
      debugPrint("-----List $filesList");
    } else {
      debugPrint("No file selected");
      update(['licencaDoc']);
    }
    update(['licencaDoc']);
  }

  handleUploadFile({required BuildContext context, required int idUser}) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: const Text("Selecione o documento"),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: const Text("Carregar licença de condução"),
              onPressed: () {
                filesList.clear();
                update(['licencaDoc']);
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
