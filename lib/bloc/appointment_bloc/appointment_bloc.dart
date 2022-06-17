import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trando_assignment/models/appointment.dart';
import 'package:trando_assignment/service/api.dart';

part 'appointment_state.dart';
part 'appointment_event.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  final Api _apiService;
  AppointmentBloc(this._apiService) : super(AppointmentLoadingState()) {
    on<LoadAppointmentEvent>((event, emit) async {
      emit(AppointmentLoadingState());
      try {
        final appointments = await _apiService.getAppointments();
        emit(AppointmentLoadedState(appointments));
      } catch (e) {
        AppointmentErrorState(e.toString());
      }
    });
    on<PostAppointmentEvent>((event, emit) async {
      emit(AppointmentLoadingState());
      try {
        final response = await _apiService.postAppointment();
        emit(AppointmentPostState(response));
      } catch (e) {
        AppointmentErrorState(e.toString());
      }
    });
  }
}
