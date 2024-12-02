import 'package:dartz/dartz.dart';
import 'package:e_mobi/core/errors/exception.dart';
import 'package:e_mobi/core/errors/failures.dart';
import 'package:e_mobi/views/features/upload/data/datasource/remote_upload_datasource.dart';
import 'package:e_mobi/views/features/upload/domain/repositories/i_ipload_repository.dart';

class UploadDocumentRepositoryImpl implements IUploadDocumentRepository {
  final RemoteUploadDataSourceImpl remoteUploadDataSourceImpl;

  UploadDocumentRepositoryImpl({required this.remoteUploadDataSourceImpl});

  @override
  Future<Either<Failure, bool>> uploadDocument(
      {UploadDocParams? params}) async {
    try {
      final result = await remoteUploadDataSourceImpl.uploadDocument(
        params: UploadDocParams(
          documento: params!.documento,
          tipoDocumento: params.tipoDocumento,
          idUser: params.idUser,
        ),
      );

      return Right(result);
    } on ServerException {
      return Left(ServerFailure(message: "Ocorreum erro no servidor"));
    } on NetWorkException {
      return Left(NetWorkFailure());
    }
  }
}
