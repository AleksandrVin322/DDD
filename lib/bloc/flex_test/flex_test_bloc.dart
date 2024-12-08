import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'flex_test_event.dart';
part 'flex_test_state.dart';

class FlexTestBloc extends Bloc<FlexTestEvent, int> {
  FlexTestBloc() : super(1) {
    on<FlexTestSwitchEvent>(_onFlexSwitch);
  }

  _onFlexSwitch(FlexTestSwitchEvent event, Emitter<int> emit) {
    if (state == 20) {
      emit(state - 19);
    } else {
      emit(state + 19);
    }
  }
}
