import 'package:bloc/bloc.dart';
import 'package:e_mobi/core/const/const.dart';
import 'package:e_mobi/core/di/di_container.dart';
import 'package:e_mobi/views/features/parents/data/model/meus_alunos_model.dart';
import 'package:e_mobi/views/features/parents/domain/usecases/get_meus_alunos_usecase.dart';
import 'package:meta/meta.dart';

part 'meus_alunos_event.dart';
part 'meus_alunos_state.dart';

class MeusAlunosBloc extends Bloc<MeusAlunosEvent, MeusAlunosState> {
  MeusAlunosBloc() : super(MeusAlunosInitial()) {
    on<GetMeusAlunosEvent>((event, emit) async {
      emit(MeusAlunosLoading(message: "carregando"));
      final result = await getIt<GetMeusAlunosMotoristaUseCase>().call(19);
      result.fold(
        (left) {
          emit(GetMeusAlunosError(message: mapFailureToMessage(left)));
        },
        (right) {
          emit(GetMeusAlunosSuccess(
            message: "motorista cadastrado com sucesso",
            data: right as MeusAlunosModel,
          ));
        },
      );
    });
  }
}
