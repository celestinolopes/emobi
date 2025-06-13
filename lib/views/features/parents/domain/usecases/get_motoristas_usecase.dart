import 'package:dartz/dartz.dart';
import 'package:e_mobi/core/errors/failures.dart';
import 'package:e_mobi/core/usecase/usecase.dart';
import 'package:e_mobi/views/features/parents/domain/repositories/parent_repository.dart';

class GeMotoristasUseCase extends UseCase<bool, getMotoristaParams> {
  final IParentRepository? iParentRepository;
  GeMotoristasUseCase({required this.iParentRepository});
  @override
  Future<Either<Failure, bool>> call(getMotoristaParams? params) async {
    final result = await iParentRepository!.getMotoristas(
        params: getMotoristaParams(
      idMotorista: params!.idMotorista,
      latitude: params.latitude,
      longitude: params.longitude,
      observacao: params.observacao,
    ));
    return result;
  }
}
