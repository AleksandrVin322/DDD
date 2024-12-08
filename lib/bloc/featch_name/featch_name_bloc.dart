import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'featch_name_event.dart';
part 'featch_name_state.dart';

class FeatchNameBloc extends Bloc<FeatchNameEvent, FeatchNameState> {
  FeatchNameBloc() : super(FeatchNameInitial()) {
    on<FeatchNameEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
