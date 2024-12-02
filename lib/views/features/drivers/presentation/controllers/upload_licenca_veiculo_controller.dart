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

enum LicencaVeiculoStatusUpload { loading, success, initial, fail }

class UploadLicencaVeiculoController extends GetxController {
  List<File> filesList = [];
  FilePickerResult? result;
  LicencaVeiculoStatusUpload licencaVeiculoStatusUpload =
      LicencaVeiculoStatusUpload.initial;
  void removeItem(int index) {
    filesList.removeAt(index);
    update(['licencaVeiculoDoc']);
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
      update(['licencaVeiculoDoc']);

      UploadController.getBase64(filesList.last).then(
        (docInBase64) async {
          licencaVeiculoStatusUpload = LicencaVeiculoStatusUpload.loading;
          update(['licencaVeiculoDoc']);

          final result = await getIt<UploadDocumentUseCase>().call(
            UploadDocParams(
                documento: docInBase64, tipoDocumento: "3", idUser: 3),
          );
          result.fold((left) {
            log(name: "Left", "fail");
            licencaVeiculoStatusUpload = LicencaVeiculoStatusUpload.fail;
          }, (right) {
            debugPrint("Documento enviado com sucesso");
            licencaVeiculoStatusUpload = LicencaVeiculoStatusUpload.success;
            update(['licencaVeiculoDoc']);

            toastification.show(
              title: const Text("Licença do veiculo enviado com sucesso"),
              style: ToastificationStyle.fillColored,
              autoCloseDuration: const Duration(seconds: 3),
              type: ToastificationType.success,
            );
          });
          update(['licencaVeiculoDoc']);
          print(docInBase64);
        },
      );
      debugPrint("-----List $filesList");
    } else {
      debugPrint("No file selected");
      update(['licencaVeiculoDoc']);
    }
    update(['licencaVeiculoDoc']);
  }

  handleUploadFile(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: const Text("Selecione o documento"),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: const Text("Carregar licença do veiculo"),
              onPressed: () {
                filesList.clear();
                update(['licencaVeiculoDoc']);
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
