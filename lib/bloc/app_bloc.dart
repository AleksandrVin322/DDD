import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<AppEvent>((event, emit) {
      print('Pizda');
    });
  }
}

class AppState {}

class AppEvent {}

class AppInitial extends AppState {}

class Flex extends AppEvent {}
