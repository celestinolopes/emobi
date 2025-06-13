import 'package:bloc/bloc.dart';
import 'package:e_mobi/core/const/const.dart';
import 'package:e_mobi/core/di/di_container.dart';
import 'package:e_mobi/views/features/drivers/data/models/cadastro_model.dart';
import 'package:e_mobi/views/features/drivers/domain/repositories/cadastro_motorista_repository.dart';
import 'package:e_mobi/views/features/drivers/domain/usecases/cadastro_motorista_usecase.dart';
import 'package:meta/meta.dart';

part 'cadastro_motorista_event.dart';
part 'cadastro_motorista_state.dart';

class CadastroMotoristaBloc
    extends Bloc<CadastroMotoristaEvent, CadastroMotoristaState> {
  CadastroMotoristaBloc() : super(CadastroMotoristaInitial()) {
    on<CadastrarMotoristaEvent>((event, emit) async {
      emit(CadastroMotoristaLoading(message: 'loading ...'));

      if (event.params.nome!.isEmpty) {
        emit(CadastroMotoristaError(message: 'Nome é obrigatório'));
        return;
      }
      if (event.params.dataNascimento!.isEmpty) {
        emit(CadastroMotoristaError(
            message: 'Data de nascimento é obrigatória'));
        return;
      }
      if (event.params.email!.isEmpty) {
        emit(CadastroMotoristaError(message: 'O email é obrigatória'));
        return;
      }
      if (event.params.ddCelular!.isEmpty) {
        emit(CadastroMotoristaError(message: 'O DDD celular é obrigatório'));
        return;
      }
      if (event.params.celular!.isEmpty) {
        emit(CadastroMotoristaError(message: 'O  celular é obrigatório'));
        return;
      }
      /*    if (event.params.ddTelefone!.isEmpty) {
        emit(CadastroMotoristaError(message: 'O DDD telefone é obrigatório'));
        return;
      }

      if (event.params.telefone!.isEmpty) {
        emit(CadastroMotoristaError(message: 'Telefone é obrigatório'));
        return;
      } */
      if (event.params.cep!.isEmpty) {
        emit(CadastroMotoristaError(message: 'o Cep é obrigatório'));
        return;
      }
      if (event.params.endereco!.isEmpty) {
        emit(CadastroMotoristaError(message: 'Endereço é obrigatório'));
        return;
      }

      if (event.params.bairro!.isEmpty) {
        emit(CadastroMotoristaError(message: 'Bairro é obrigatório'));
        return;
      }
      if (event.params.cidade!.isEmpty) {
        emit(CadastroMotoristaError(message: 'Cidade é obrigatório'));
        return;
      }
      if (event.params.estado!.isEmpty) {
        emit(CadastroMotoristaError(message: 'Estado é obrigatório'));
        return;
      }

      if (event.params.email!.isEmpty) {
        emit(CadastroMotoristaError(message: 'Email é obrigatório'));
        return;
      }

      final result =
          await getIt<CadastroMotoristaUseCase>().call(CadastroMotoristaParams(
        nome: event.params.nome,
        email: event.params.email,
        dataNascimento: event.params.dataNascimento,
        celular: "${event.params.ddCelular}${event.params.celular}",
        telefone: "${event.params.ddTelefone}${event.params.telefone}",
        cep: event.params.cep,
        ddCelular: event.params.ddTelefone,
        ddTelefone: event.params.ddTelefone,
        bairro: event.params.bairro,
        endereco: event.params.endereco,
        numero: event.params.numero,
        complemento: event.params.complemento,
        cidade: event.params.cidade,
        estado: event.params.estado,
        tipo: event.params.tipo,
      ));

      result.fold((left) {
        emit(CadastroMotoristaError(message: mapFailureToMessage(left)));
      }, (right) {
        emit(CadastroMotoristaSuccess(
          message: "motorista cadastrado com sucesso",
          data: right as CadastroModel,
        ));
      });
    });
  }
}
