import 'package:dartz/dartz.dart';
import 'package:e_mobi/core/errors/failures.dart';
import 'package:e_mobi/core/usecase/usecase.dart';
import 'package:e_mobi/views/features/parents/domain/repositories/parent_repository.dart';

class GetMeuVeiculoUseCase extends UseCase<bool, int> {
  final IParentRepository? iParentRepository;
  GetMeuVeiculoUseCase({required this.iParentRepository});
  @override
  Future<Either<Failure, bool>> call(int? params) async {
    final result =
        await iParentRepository!.getMeuVeiculoMotorista(idMotorista: params);
    return result;
  }
}
