import 'package:dartz/dartz.dart';
import 'package:e_mobi/core/errors/failures.dart';
import 'package:e_mobi/core/usecase/usecase.dart';
import 'package:e_mobi/views/features/parents/domain/entities/meus_alunos_entity.dart';
import 'package:e_mobi/views/features/parents/domain/repositories/parent_repository.dart';

class GetMeusAlunosMotoristaUseCase extends UseCase<MeusAlunosEntity, int> {
  final IParentRepository? iParentRepository;
  GetMeusAlunosMotoristaUseCase({required this.iParentRepository});
  @override
  Future<Either<Failure, MeusAlunosEntity>> call(int? params) async {
    final result =
        await iParentRepository!.getMeusAlunoMotorista(idMotorista: params);
    return result;
  }
}
