import 'package:bloc/bloc.dart';
import 'package:e_mobi/core/const/const.dart';
import 'package:e_mobi/views/features/childrens/data/models/cadastro_model.dart';
import 'package:e_mobi/views/features/childrens/domain/repositories/cadastro_aluno_repository.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/di/di_container.dart';
import '../../../domain/usecases/cadastro_motorista_usecase.dart';

part 'cadastro_aluno_event.dart';
part 'cadastro_aluno_state.dart';

class CadastroAlunoBloc extends Bloc<CadastroAlunoEvent, CadastroAlunoState> {
  CadastroAlunoBloc() : super(CadastroAlunoInitial()) {
    on<CadastrarAlunoEvent>((event, emit) async {
      emit(CadastroAlunoLoading(message: 'loading ...'));

      if (event.params.nome!.isEmpty) {
        emit(CadastroAlunoError(message: 'Nome é obrigatório'));
        return;
      }
      if (event.params.dataNascimento!.isEmpty) {
        emit(CadastroAlunoError(message: 'Data de nascimento é obrigatória'));
        return;
      }

      if (event.params.endereco!.isEmpty) {
        emit(CadastroAlunoError(message: 'Endereço é obrigatório'));
        return;
      }

      if (event.params.escola!.isEmpty) {
        emit(CadastroAlunoError(message: 'Escola é obrigatório'));
        return;
      }
      if (event.params.serie!.isEmpty) {
        emit(CadastroAlunoError(message: 'Serie é obrigatório'));
        return;
      }
      final result =
          await getIt<CadastroAlunoUseCase>().call(CadastroAlunoParams(
        nome: event.params.nome,
        serie: event.params.serie,
        dataNascimento: event.params.dataNascimento,
        escola: event.params.escola,
        endereco: event.params.endereco,
        numero: event.params.numero,
        idPai: event.params.idPai,
      ));

      result.fold((left) {
        emit(CadastroAlunoError(message: mapFailureToMessage(left)));
      }, (right) {
        emit(CadastroAlunoSuccess(
          message: "aluno cadastrado com sucesso",
          data: right as CadastroAlunoModel,
        ));
      });
    });
  }
}
