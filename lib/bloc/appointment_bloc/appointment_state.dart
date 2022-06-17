part of 'appointment_bloc.dart';

@immutable
abstract class AppointmentState extends Equatable {}

class AppointmentLoadingState extends AppointmentState {
  @override
  List<Object?> get props => [];
}

class AppointmentLoadedState extends AppointmentState {
  final List<Appointment> appointments;
  AppointmentLoadedState(this.appointments);
  @override
  List<Object?> get props => [appointments];
}

class AppointmentErrorState extends AppointmentState {
  final String error;
  AppointmentErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

class AppointmentPostState extends AppointmentState {
  final dynamic response;
  AppointmentPostState(this.response);
  @override
  List<Object?> get props => [response];
}
