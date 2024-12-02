import 'package:dartz/dartz.dart';
import 'package:e_mobi/core/errors/failures.dart';

abstract class IUploadDocumentRepository {
  Future<Either<Failure, bool>> uploadDocument({UploadDocParams? params});
}

class UploadDocParams {
  final String documento;
  final String tipoDocumento;
  final int idUser;

  UploadDocParams(
      {required this.documento,
      required this.tipoDocumento,
      required this.idUser});
}
