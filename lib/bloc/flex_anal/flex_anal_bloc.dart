import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'flex_anal_event.dart';
part 'flex_anal_state.dart';

class FlexAnalBloc extends Bloc<FlexAnalEvent, int> {
  FlexAnalBloc() : super(1) {
    on<FlexAnalSwitchEvent>(_onFlexSwitch);
  }

  _onFlexSwitch(FlexAnalSwitchEvent event, Emitter<int> emit) {
    if (state == 20) {
      emit(state - 19);
    } else {
      emit(state + 19);
    }
  }
}
