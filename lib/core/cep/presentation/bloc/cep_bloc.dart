import 'package:bloc/bloc.dart';
import 'package:e_mobi/core/cep/data/models/cep_model.dart';
import 'package:e_mobi/core/cep/domain/usecases/get_cep_usecase.dart';
import 'package:e_mobi/core/const/const.dart';
import 'package:e_mobi/core/di/di_container.dart';
import 'package:meta/meta.dart';

part 'cep_event.dart';
part 'cep_state.dart';

class CepBloc extends Bloc<CepEvent, CepState> {
  CepBloc() : super(CepInitial()) {
    on<GetCepEvent>((event, emit) async {
      emit(CepLoadingState());
      final result = await getIt<GetCepUseCase>().call(event.cep);

      result.fold((fail) {
        emit(CepInvalidState(errorMessage: mapFailureToMessage(fail)));
      }, (success) {
        emit(CepSuccessState(cepModelo: success as CepModelo));
      });
    });
  }
}
