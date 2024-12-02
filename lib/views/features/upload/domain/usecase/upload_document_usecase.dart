import 'package:dartz/dartz.dart';
import 'package:e_mobi/core/errors/failures.dart';
import 'package:e_mobi/core/usecase/usecase.dart';
import 'package:e_mobi/views/features/upload/domain/repositories/i_ipload_repository.dart';

class UploadDocumentUseCase extends UseCase<bool, UploadDocParams> {
  final IUploadDocumentRepository uploadDocumentRepository;

  UploadDocumentUseCase(this.uploadDocumentRepository);

  @override
  Future<Either<Failure, bool>> call(UploadDocParams? params) async {
    final uploadResult = await uploadDocumentRepository.uploadDocument(
      params: UploadDocParams(
        documento: params!.documento,
        tipoDocumento: params.tipoDocumento,
        idUser: params.idUser,
      ),
    );

    return uploadResult;
  }
}
