import 'package:dartz/dartz.dart';
import 'package:e_mobi/core/errors/failures.dart';
import 'package:e_mobi/core/usecase/usecase.dart';
import 'package:e_mobi/views/features/parents/domain/entities/desembrarque_entity.dart';
import 'package:e_mobi/views/features/parents/domain/repositories/parent_repository.dart';

class GetMeuDesembarqueMotoristaUseCase
    extends UseCase<List<DesembarqueaEntity>, int> {
  final IParentRepository? iParentRepository;
  GetMeuDesembarqueMotoristaUseCase({required this.iParentRepository});
  @override
  Future<Either<Failure, List<DesembarqueaEntity>>> call(int? params) async {
    final result = await iParentRepository!
        .getMeuDesembarqueMotorista(idMotorista: params);
    return result;
  }
}
