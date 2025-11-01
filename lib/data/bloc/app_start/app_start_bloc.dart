import 'package:mobile/data/bloc/app_start/app_start_event.dart';
import 'package:mobile/data/bloc/app_start/app_start_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStartBloc extends Bloc<AppStartEvent, AppStartState> {
  AppStartBloc() : super(AppStartInitial()) {
    on<CheckFirstTimeEvent>(_onCheckFirstTime);
  }

  Future<void> _onCheckFirstTime(
    CheckFirstTimeEvent event,
    Emitter<AppStartState> emit,
  ) async {
    emit(AppStartLoading());

    await Future.delayed(const Duration(seconds: 2));

    try {
      final prefs = await SharedPreferences.getInstance();
      final isFirstTime = prefs.getBool('isFirstTime') ?? true;

      if (isFirstTime) {
        await prefs.setBool('isFirstTime', false);
        emit(FirstTimeUser());
      } else {
        emit(ReturningUser());
      }
    } catch (e) {
      emit(AppStartError());
    }
  }
}
