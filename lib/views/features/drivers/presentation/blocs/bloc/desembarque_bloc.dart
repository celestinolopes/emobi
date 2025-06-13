import 'package:bloc/bloc.dart';
import 'package:e_mobi/core/const/const.dart';
import 'package:e_mobi/core/di/di_container.dart';
import 'package:e_mobi/views/features/parents/data/model/desembarque_model.dart';
import 'package:e_mobi/views/features/parents/domain/usecases/get_meu_desembarque.dart';
import 'package:meta/meta.dart';

part 'desembarque_event.dart';
part 'desembarque_state.dart';

class DesembarqueBloc extends Bloc<DesembarqueEvent, DesembarqueState> {
  DesembarqueBloc() : super(DesembarqueInitial()) {
    on<GetDesembarqueEvent>((event, emit) async {
      emit(DesembarqueLoading(message: "carregando"));
      final result = await getIt<GetMeuDesembarqueMotoristaUseCase>().call(19);
      result.fold(
        (left) {
          emit(DesemmbarqueErrorEror(message: mapFailureToMessage(left)));
        },
        (right) {
          emit(DesembarqueSuccess(
            message: "motorista cadastrado com sucesso",
            data: right as List<DesembarqueModel>,
          ));
        },
      );
    });
  }
}
