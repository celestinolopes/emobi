import 'package:bloc/bloc.dart';
import 'package:e_mobi/core/const/const.dart';
import 'package:e_mobi/core/di/di_container.dart';
import 'package:e_mobi/views/features/childrens/data/models/meus_filhos_model.dart';
import 'package:e_mobi/views/features/childrens/domain/usecases/get_meus_filhos.dart';
import 'package:meta/meta.dart';

part 'meus_filhos_event.dart';
part 'meus_filhos_state.dart';

class MeusFilhosBloc extends Bloc<MeusFilhosEvent, MeusFilhosState> {
  MeusFilhosBloc() : super(MeusFilhosInitial()) {
    on<GetMeusFilhosEvent>((event, emit) async {
      emit(MeusFilhosLoading(message: "carregando ..."));
      final result = await getIt<GetFilhosUseCase>()
          .call(getAlunosParams(userId: event.idResponsavel));

      result.fold((left) {
        emit(MeusFilhosError(message: mapFailureToMessage(left)));
      }, (right) async {
        emit(MeusFilhosLoad(
          message: "",
          data: right as List<MeusFilhosModel>,
        ));
      });
    });
  }
}
