import 'dart:convert';
import 'dart:io';

import 'package:mime/mime.dart';

class UploadController {
  static String getFileSize(File file) {
    var fileSizeInBytes = file.lengthSync();

    // Convert bytes to kilobytes
    var fileSizeInKB = fileSizeInBytes / 1024;

    if (fileSizeInKB > 1000) {
      // Convert kilobytes to megabytes and return as a string
      var fileSizeInMB = fileSizeInKB / 1024;
      return '${fileSizeInMB.toStringAsFixed(2)} MB';
    } else {
      return '${fileSizeInKB.toStringAsFixed(2)} KB';
    }
  }

  static String getFileName(File file) {
    var filename = file.path.split("/");
    return filename[filename.length - 1];
  }

  static String? getContentType(String filePath) {
    // Determine file extension
    String extension = filePath.split('.').last;
    // Lookup MIME type based on file extension
    String? mimeType = lookupMimeType(filePath);
    return mimeType;
  }

  static Future<String> getBase64(File file) async {
    String? base64;
    String? contentType = getContentType(file.path);
    if (contentType != null) {
      if (contentType.contains("image")) {
        final uInt8List = file.readAsBytesSync();
        base64 = base64Encode(uInt8List);
      } else {
        final uInt8List = await file.readAsBytes();
        base64 = base64Encode(uInt8List);
      }
      print("contentType: $contentType");
    }
    return base64 ?? "";
  }

  static checkTypeFile(File file) {
    var filename = file.path.split(".");
    if (filename[filename.length - 1] == 'pdf') {
      return "assets/svg/pdf.svg";
    } else if (filename[filename.length - 1] == 'png') {
      return "assets/svg/png.svg";
    } else if (filename[filename.length - 1] == 'jpg') {
      return "assets/svg/jpg.svg";
    } else if (filename[filename.length - 1] == 'xls') {
      return "assets/svg/xls.svg";
    } else if (filename[filename.length - 1] == 'jpeg') {
      return "assets/svg/jpg.svg";
    } else {
      return '';
    }
  }
}
