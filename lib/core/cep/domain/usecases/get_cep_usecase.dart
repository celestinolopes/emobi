import 'package:dartz/dartz.dart';
import 'package:e_mobi/core/cep/domain/entities/cep_entity.dart';
import 'package:e_mobi/core/cep/domain/repositories/i_get_cep_repository.dart';
import 'package:e_mobi/core/errors/failures.dart';
import 'package:e_mobi/core/usecase/usecase.dart';

class GetCepUseCase extends UseCase<CepEntity, String> {
  final ICepRepository? cepRepository;
  GetCepUseCase({required this.cepRepository});
  @override
  Future<Either<Failure, CepEntity>> call(String? params) async {
    final result = await cepRepository!.getCep(cep: params);
    return result;
  }
}
