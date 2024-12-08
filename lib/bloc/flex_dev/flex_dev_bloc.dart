import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'flex_dev_event.dart';
part 'flex_dev_state.dart';

class FlexDevBloc extends Bloc<FlexDevEvent, int> {
  FlexDevBloc() : super(1) {
    on<FlexDevSwitchEvent>(_onFlexSwitch);
  }

  _onFlexSwitch(FlexDevSwitchEvent event, Emitter<int> emit) {
     if (state == 20) {
      emit(state - 19);
    } else {
      emit(state + 19);
    }
  }
}
