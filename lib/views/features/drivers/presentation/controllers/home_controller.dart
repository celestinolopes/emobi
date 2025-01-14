import 'dart:io';

import 'package:e_mobi/views/features/drivers/presentation/controllers/helper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:permission_handler/permission_handler.dart';

import 'file_model.dart';

class HomeController extends GetxController {
  List<File> filesList = [];
  FilePickerResult? result;

  handleSubmit() async {
    var fileList = <FilesModel>[];
    debugPrint("--------File Before Convert $filesList");
    await Future.wait(filesList.asMap().entries.map((element) async {
      var base64String = await UploadController.getBase64(element.value);
      fileList.add(
        FilesModel(
          filename: UploadController.getFileName(element.value),
          fileContent: base64String,
        ),
      );
    }).toList());

    // Here is FileList base64
    debugPrint("--------After  Convert ${fileList.map((e) => e.fileContent)}");

    //Now you can submit list of base64 to api
  }

  handleUpload(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: const Text("Selecione o documento"),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: const Text("Carregar documento"),
              onPressed: () {
                uploadFile();
                Navigator.pop(context);
              },
            ),
            CupertinoActionSheetAction(
              child: const Text("Galeria"),
              onPressed: () {
                uploadPhoto();
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

  handleUploadFile(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: const Text("Selecione o documento"),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: const Text("Carregar documento"),
              onPressed: () {
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

  void removeItem(int index) {
    filesList.removeAt(index);
    update(['home']);
  }

  Future<void> uploadFile() async {
    if (filesList.length >= 5) {
      return debugPrint("Maximum file limit reached");
    }
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
      filesList.addAll(
          listTemp.take(5 - filesList.length)); // Take only remaining slots
      update(['home']);
      debugPrint("-----List $filesList");
    } else {
      debugPrint("No file selected");
      update(['home']);
    }
    update(['home']);
  }

  Future<void> uploadPhoto() async {
    if (filesList.length >= 5) {
      return debugPrint("Maximum file limit reached");
    }
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
      update(['home']);
      debugPrint("-----Photo List $filesList");
    } else {
      debugPrint("No photo selected");
      update(['home']);
    }
  }
}
