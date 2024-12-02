import 'dart:developer';
import 'dart:io';

import 'package:e_mobi/core/di/di_container.dart';
import 'package:e_mobi/views/features/drivers/presentation/controllers/helper.dart';
import 'package:e_mobi/views/features/upload/domain/repositories/i_ipload_repository.dart';
import 'package:e_mobi/views/features/upload/domain/usecase/upload_document_usecase.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toastification/toastification.dart';

enum PhotoAlunotatusUpload { loading, success, initial, fail }

class UploadFotoAllunoController extends GetxController {
  List<File> filesList = [];
  FilePickerResult? result;
  PhotoAlunotatusUpload photoAlunotatusUpload = PhotoAlunotatusUpload.initial;
  void removeItem(int index) {
    filesList.removeAt(index);
    update(['photoAluno']);
  }

  Future<void> uploadFile() async {
    result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowCompression: true,
      allowedExtensions: ['png', 'jpg', "jpeg"],
    );

    if (result != null) {
      var listTemp = result!.paths.map((path) => File(path!)).toList();
      filesList.addAll(listTemp.take(5 - filesList.length));
      update(['photoAluno']);
      debugPrint("-----List $filesList");
    } else {
      debugPrint("No file selected");
      update(['photoAluno']);
    }
    update(['photoAluno']);
  }

  Future<void> uploadPhoto() async {
    var status = await Permission.photos.status;
    if (!status.isGranted) {
      await Permission.photos.request();
      status = await Permission.photos.status;
      if (!status.isGranted) {
        return debugPrint('Permission denied for accessing photos');
      }
    }
    result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
      allowCompression: true,
    );
    if (result != null && result!.files.isNotEmpty) {
      final List<File> listTemp =
          result!.paths.map((path) => File(path!)).toList();
      filesList.addAll(listTemp.take(5 - filesList.length));
      update(['photoAluno']);

      UploadController.getBase64(filesList.last).then(
        (docInBase64) async {
          photoAlunotatusUpload = PhotoAlunotatusUpload.loading;
          update(['photoAluno']);

          final result = await getIt<UploadDocumentUseCase>().call(
            UploadDocParams(
                documento: docInBase64, tipoDocumento: "3", idUser: 3),
          );
          result.fold((left) {
            log(name: "Left", "fail");
            photoAlunotatusUpload = PhotoAlunotatusUpload.fail;
            toastification.show(
              title: const Text("Erro ao enviar foto do aluno"),
              style: ToastificationStyle.fillColored,
              autoCloseDuration: const Duration(seconds: 3),
              type: ToastificationType.error,
            );
          }, (right) {
            debugPrint("Documento enviado ");
            photoAlunotatusUpload = PhotoAlunotatusUpload.success;
            update(['photoAluno']);
            toastification.show(
              title: const Text("Foto do aluno enviado"),
              style: ToastificationStyle.fillColored,
              autoCloseDuration: const Duration(seconds: 3),
              type: ToastificationType.success,
            );
          });
          update(['photoAluno']);
          print(docInBase64);
        },
      );
      debugPrint("-----Photo List $filesList");
    } else {
      debugPrint("No photo selected");
      update(['photoAluno']);
    }
  }

  handleUploadFile(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: const Text("Selecione o documento"),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: const Text("Carregar foto do veiculo"),
              onPressed: () {
                filesList.clear();
                update(['photoAluno']);
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
