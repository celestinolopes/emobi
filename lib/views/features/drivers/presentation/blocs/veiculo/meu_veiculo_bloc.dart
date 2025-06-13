import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'meu_veiculo_event.dart';
part 'meu_veiculo_state.dart';

class MeuVeiculoBloc extends Bloc<MeuVeiculoEvent, MeuVeiculoState> {
  MeuVeiculoBloc() : super(MeuVeiculoInitial()) {
    on<MeuVeiculoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
